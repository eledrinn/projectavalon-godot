class_name BreathingHole
extends Area3D

## BreathingHole V2
## Environmental hazard system for Project Avalon - Native Starter region
## Cycles through DORMANT → WARNING → ACTIVE → DISSIPATE states
## Following Godot Implementation Doctrine v1 - SIMPLE is better than complex
## Spec Ref: Native_Starter_Blockout_Spec_v1.md §5.1

# ============================================================================
# EXPORTS - Configurable timing and damage
# ============================================================================
@export var damage_per_tick: int = 5
@export var dormant_duration: float = 4.0
@export var warning_duration: float = 1.0
@export var active_duration: float = 3.0
@export var dissipate_duration: float = 2.0

# ============================================================================
# STATE MACHINE
# ============================================================================
enum State {DORMANT, WARNING, ACTIVE, DISSIPATE}
var current_state: State = State.DORMANT

# ============================================================================
# SIGNALS
# ============================================================================
signal state_changed(new_state: State)
signal player_damaged(amount: int)
signal visual_color_changed(color: Color)

# ============================================================================
# INTERNAL STATE
# ============================================================================
var _state_timer: Timer
var _damage_timer: Timer
var _players_in_zone: Array[Node3D] = []

# Color values for each state (RGB 0.0-1.0)
var _state_colors: Dictionary = {
	State.DORMANT: Color(0.2, 0.6, 0.3, 1.0),    # Green - safe
	State.WARNING: Color(0.9, 0.7, 0.1, 1.0),    # Yellow - warning
	State.ACTIVE: Color(0.8, 0.2, 0.1, 1.0),     # Red - danger
	State.DISSIPATE: Color(0.4, 0.4, 0.4, 1.0)   # Gray - fading
}

# ============================================================================
# LIFECYCLE
# ============================================================================
func _ready() -> void:
	# Create and configure state timer
	_state_timer = Timer.new()
	_state_timer.one_shot = true
	add_child(_state_timer)
	_state_timer.timeout.connect(_on_state_timer_timeout)
	
	# Create and configure damage timer
	_damage_timer = Timer.new()
	_damage_timer.wait_time = 1.0  # 1 tick per second
	add_child(_damage_timer)
	_damage_timer.timeout.connect(_on_damage_tick)
	
	# Connect body detection signals
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
	# Start the cycle
	_transition_to(State.DORMANT)

func _exit_tree() -> void:
	# Clean up timers to prevent issues
	if _state_timer:
		_state_timer.stop()
	if _damage_timer:
		_damage_timer.stop()

# ============================================================================
# STATE MACHINE LOGIC
# ============================================================================
func _transition_to(new_state: State) -> void:
	current_state = new_state
	state_changed.emit(new_state)
	visual_color_changed.emit(_state_colors[new_state])
	_handle_state_entry(new_state)
	
	var duration: float = _get_duration_for_state(new_state)
	_state_timer.start(duration)

func _get_duration_for_state(state: State) -> float:
	match state:
		State.DORMANT: return dormant_duration
		State.WARNING: return warning_duration
		State.ACTIVE: return active_duration
		State.DISSIPATE: return dissipate_duration
	return 1.0

func _get_next_state(state: State) -> State:
	match state:
		State.DORMANT: return State.WARNING
		State.WARNING: return State.ACTIVE
		State.ACTIVE: return State.DISSIPATE
		State.DISSIPATE: return State.DORMANT
	return State.DORMANT

func _on_state_timer_timeout() -> void:
	var next_state: State = _get_next_state(current_state)
	_transition_to(next_state)

# ============================================================================
# DAMAGE SYSTEM
# ============================================================================
func _on_damage_tick() -> void:
	if current_state != State.ACTIVE:
		return
	
	# Deal damage to all players in zone
	for player: Node3D in _players_in_zone:
		_apply_damage_to_player(player)

func _apply_damage_to_player(player: Node3D) -> void:
	if player.has_method("take_damage"):
		player.take_damage(damage_per_tick)
		player_damaged.emit(damage_per_tick)
	elif "health" in player and player.health is int:
		player.health -= damage_per_tick
		player_damaged.emit(damage_per_tick)

func _start_damage() -> void:
	_damage_timer.start()
	# Immediate first tick
	_on_damage_tick()

func _stop_damage() -> void:
	_damage_timer.stop()

# ============================================================================
# STATE HANDLERS
# ============================================================================
func _handle_state_dormant() -> void:
	_stop_damage()

func _handle_state_warning() -> void:
	_stop_damage()

func _handle_state_active() -> void:
	_start_damage()

func _handle_state_dissipate() -> void:
	_stop_damage()

func _handle_state_entry(state: State) -> void:
	match state:
		State.DORMANT: _handle_state_dormant()
		State.WARNING: _handle_state_warning()
		State.ACTIVE: _handle_state_active()
		State.DISSIPATE: _handle_state_dissipate()

# ============================================================================
# PLAYER DETECTION
# ============================================================================
func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player") or body.name == "Player":
		if not body in _players_in_zone:
			_players_in_zone.append(body)

func _on_body_exited(body: Node3D) -> void:
	if body in _players_in_zone:
		_players_in_zone.erase(body)

# ============================================================================
# PUBLIC API
# ============================================================================
func get_current_state() -> State:
	return current_state

func get_current_state_name() -> String:
	match current_state:
		State.DORMANT: return "DORMANT"
		State.WARNING: return "WARNING"
		State.ACTIVE: return "ACTIVE"
		State.DISSIPATE: return "DISSIPATE"
	return "UNKNOWN"

func force_state(new_state: State) -> void:
	"""Force hazard into specific state (for testing)"""
	_state_timer.stop()
	_transition_to(new_state)

func get_state_color(state: State) -> Color:
	return _state_colors.get(state, Color.WHITE)
