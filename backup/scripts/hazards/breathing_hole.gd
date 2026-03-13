class_name BreathingHole
extends Area3D

## BreathingHole
## Environmental hazard system for Project Avalon - Native Starter region
## Gas vent that cycles through DORMANT → WARNING → ACTIVE → DISSIPATE states
## Location: BreathingHoles landmark at (90, -5, 40)
##
## Agent Output Protocol Header:
## | Field | Value |
## |-------|-------|
## | **System** | Breathing Hole Hazard |
## | **Status** | Implemented |
## | **Location** | scenes/hazards/breathing_hole.tscn |
## | **Spec Ref** | Native_Starter_Blockout_Spec_v1.md §5.1 |

# ============================================================================
# SIGNALS
# ============================================================================
signal state_changed(new_state: HazardState, old_state: HazardState)
signal player_entered_hazard(player: Node3D)
signal player_exited_hazard(player: Node3D)
signal player_damaged(player: Node3D, damage: int)

# ============================================================================
# ENUMS
# ============================================================================
enum HazardState {
	DORMANT,    # Safe phase - gentle bubbling
	WARNING,    # Telegraph phase - visual/audio warning
	ACTIVE,     # Danger phase - gas eruption, damage dealt
	DISSIPATE   # Cooldown phase - gas fading
}

# ============================================================================
# EXPORTS - Configurable timing and damage
# ============================================================================
@export_group("Timing (seconds)")
@export var dormant_duration: float = 4.0   # 4s safe window
@export var warning_duration: float = 1.0   # 1s telegraph
@export var active_duration: float = 3.0    # 3s danger window
@export var dissipate_duration: float = 2.0 # 2s cooldown

@export_group("Damage")
@export var damage_per_tick: int = 5        # 5 HP per tick
@export var damage_tick_rate: float = 1.0   # 1 tick per second

@export_group("Safe Path")
@export var safe_path_width: float = 2.0    # 2m wide safe corridor
@export var safe_path_debug: bool = false   # Visualize safe path

@export_group("Visuals")
@export var dormant_color: Color = Color(0.1, 0.4, 0.1, 1.0)      # Green
@export var warning_color: Color = Color(0.8, 0.6, 0.1, 1.0)      # Yellow/Orange
@export var active_color: Color = Color(0.6, 0.2, 0.1, 1.0)       # Red/Dark
@export var dissipate_color: Color = Color(0.3, 0.3, 0.3, 1.0)    # Gray

# ============================================================================
# NODES
# ============================================================================
@onready var hazard_zone: CollisionShape3D = $HazardZone
@onready var visual_indicator: MeshInstance3D = $VisualIndicator
@onready var vent_meshes: Node3D = $VentMeshes
@onready var safe_path_marker: MeshInstance3D = $SafePathMarker
@onready var state_timer: Timer = $StateTimer
@onready var damage_timer: Timer = $DamageTimer

# ============================================================================
# STATE
# ============================================================================
var current_state: HazardState = HazardState.DORMANT
var players_in_hazard: Dictionary = {}  # player_node -> {on_safe_path: bool}
var cycle_count: int = 0

# Hazard zone dimensions (matches spec: 12m x 8m depression)
var hazard_size: Vector3 = Vector3(12.0, 2.0, 8.0)

# ============================================================================
# LIFECYCLE
# ============================================================================
func _ready():
	_setup_collision()
	_setup_visuals()
	_start_cycle()
	print("BreathingHole initialized at ", global_position, " - State: DORMANT")

func _setup_collision():
	# Connect signals for player detection
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
	# Configure hazard zone collision
	if hazard_zone and hazard_zone.shape is BoxShape3D:
		var box_shape = hazard_zone.shape as BoxShape3D
		box_shape.size = hazard_size

func _setup_visuals():
	_update_visuals_for_state(HazardState.DORMANT)
	
	# Hide safe path marker unless debugging
	if safe_path_marker:
		safe_path_marker.visible = safe_path_debug

func _start_cycle():
	_transition_to(HazardState.DORMANT)

# ============================================================================
# STATE MACHINE
# ============================================================================
func _transition_to(new_state: HazardState):
	var old_state = current_state
	current_state = new_state
	
	# Update visuals
	_update_visuals_for_state(new_state)
	
	# Set timer for next state
	var duration = _get_duration_for_state(new_state)
	state_timer.wait_time = duration
	state_timer.one_shot = true
	state_timer.timeout.connect(_on_state_timer_timeout, CONNECT_ONE_SHOT)
	state_timer.start()
	
	# Handle state-specific logic
	_match_state(new_state, old_state)
	
	# Emit signal
	state_changed.emit(new_state, old_state)

func _match_state(new_state: HazardState, old_state: HazardState):
	match new_state:
		HazardState.DORMANT:
			print("BreathingHole: DORMANT - Safe to traverse")
			_stop_damage()
			
		HazardState.WARNING:
			print("BreathingHole: WARNING - Gas building up!")
			_stop_damage()
			# TODO: Play warning audio cue (rising tone)
			
		HazardState.ACTIVE:
			print("BreathingHole: ACTIVE - Toxic gas eruption!")
			_start_damage()
			# TODO: Play active audio (hiss + whoosh)
			
		HazardState.DISSIPATE:
			print("BreathingHole: DISSIPATE - Gas clearing")
			_stop_damage()
			cycle_count += 1

func _get_duration_for_state(state: HazardState) -> float:
	match state:
		HazardState.DORMANT: return dormant_duration
		HazardState.WARNING: return warning_duration
		HazardState.ACTIVE: return active_duration
		HazardState.DISSIPATE: return dissipate_duration
	return 1.0

func _get_next_state(state: HazardState) -> HazardState:
	match state:
		HazardState.DORMANT: return HazardState.WARNING
		HazardState.WARNING: return HazardState.ACTIVE
		HazardState.ACTIVE: return HazardState.DISSIPATE
		HazardState.DISSIPATE: return HazardState.DORMANT
	return HazardState.DORMANT

func _on_state_timer_timeout():
	var next_state = _get_next_state(current_state)
	_transition_to(next_state)

# ============================================================================
# VISUAL FEEDBACK
# ============================================================================
func _update_visuals_for_state(state: HazardState):
	var target_color = _get_color_for_state(state)
	
	# Update main visual indicator
	if visual_indicator:
		var material = StandardMaterial3D.new()
		material.albedo_color = target_color
		material.emission_enabled = true
		material.emission = target_color * 0.5
		
		if state == HazardState.ACTIVE:
			material.emission_energy_multiplier = 2.0
			material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
			material.albedo_color.a = 0.7
		elif state == HazardState.WARNING:
			material.emission_energy_multiplier = 1.5
		else:
			material.emission_energy_multiplier = 0.3
		
		visual_indicator.material_override = material
	
	# Update vent mesh colors
	if vent_meshes:
		for vent in vent_meshes.get_children():
			if vent is MeshInstance3D:
				var vent_material = StandardMaterial3D.new()
				vent_material.albedo_color = target_color.darkened(0.3)
				vent_material.emission_enabled = true
				vent_material.emission = target_color * 0.3
				
				if state == HazardState.ACTIVE:
					vent_material.emission_energy_multiplier = 3.0
				elif state == HazardState.WARNING:
					vent_material.emission_energy_multiplier = 1.5
				else:
					vent_material.emission_energy_multiplier = 0.5
				
				vent.material_override = vent_material

func _get_color_for_state(state: HazardState) -> Color:
	match state:
		HazardState.DORMANT: return dormant_color
		HazardState.WARNING: return warning_color
		HazardState.ACTIVE: return active_color
		HazardState.DISSIPATE: return dissipate_color
	return Color.WHITE

# ============================================================================
# DAMAGE SYSTEM
# ============================================================================
func _start_damage():
	# Start dealing damage to players in hazard zone
	damage_timer.wait_time = damage_tick_rate
	damage_timer.timeout.connect(_on_damage_tick, CONNECT_ONE_SHOT)
	damage_timer.start()

func _stop_damage():
	# Stop damage timer
	if damage_timer.is_connected("timeout", _on_damage_tick):
		damage_timer.timeout.disconnect(_on_damage_tick)
	damage_timer.stop()

func _on_damage_tick():
	if current_state != HazardState.ACTIVE:
		return
	
	# Deal damage to all players in hazard (unless on safe path)
	for player in players_in_hazard.keys():
		var player_data = players_in_hazard[player]
		if not player_data.on_safe_path:
			_apply_damage(player)
	
	# Continue ticking if still active
	if current_state == HazardState.ACTIVE:
		damage_timer.timeout.connect(_on_damage_tick, CONNECT_ONE_SHOT)
		damage_timer.start()

func _apply_damage(player: Node3D):
	# Check if player has health system
	if player.has_method("take_damage"):
		player.take_damage(damage_per_tick)
		player_damaged.emit(player, damage_per_tick)
		print("BreathingHole dealt ", damage_per_tick, " damage to ", player.name)
	elif player.has_method("apply_damage"):
		player.apply_damage(damage_per_tick)
		player_damaged.emit(player, damage_per_tick)
		print("BreathingHole dealt ", damage_per_tick, " damage to ", player.name)
	else:
		# Fallback: try to access health property directly
		if "health" in player:
			player.health -= damage_per_tick
			player_damaged.emit(player, damage_per_tick)
			print("BreathingHole dealt ", damage_per_tick, " damage to ", player.name)

# ============================================================================
# SAFE PATH DETECTION
# ============================================================================
func _is_on_safe_path(player: Node3D) -> bool:
	# Safe path runs N-S through the center of the hazard zone
	# Width: safe_path_width (default 2m)
	# The safe path is the center X-axis strip along the Z-axis
	
	var local_pos = to_local(player.global_position)
	
	# Safe path is centered on X=0, runs full length of Z
	# Check if player is within safe_path_width/2 of center X
	var half_width = safe_path_width / 2.0
	
	return abs(local_pos.x) <= half_width

func _update_player_safe_path_status(player: Node3D):
	if player in players_in_hazard:
		players_in_hazard[player].on_safe_path = _is_on_safe_path(player)

# ============================================================================
# PLAYER DETECTION
# ============================================================================
func _on_body_entered(body: Node3D):
	# Check if this is a player
	if body.is_in_group("player") or body.name == "Player" or body is CharacterBody3D:
		players_in_hazard[body] = {
			on_safe_path = _is_on_safe_path(body)
		}
		player_entered_hazard.emit(body)
		print("Player entered BreathingHole hazard: ", body.name)

func _on_body_exited(body: Node3D):
	if body in players_in_hazard:
		players_in_hazard.erase(body)
		player_exited_hazard.emit(body)
		print("Player exited BreathingHole hazard: ", body.name)

func _physics_process(_delta):
	# Update safe path status for all players in hazard
	for player in players_in_hazard.keys():
		_update_player_safe_path_status(player)

# ============================================================================
# PUBLIC API
# ============================================================================
func get_current_state() -> HazardState:
	return current_state

func get_current_state_name() -> String:
	match current_state:
		HazardState.DORMANT: return "DORMANT"
		HazardState.WARNING: return "WARNING"
		HazardState.ACTIVE: return "ACTIVE"
		HazardState.DISSIPATE: return "DISSIPATE"
	return "UNKNOWN"

func is_player_in_hazard(player: Node3D) -> bool:
	return player in players_in_hazard

func is_player_on_safe_path(player: Node3D) -> bool:
	if player in players_in_hazard:
		return players_in_hazard[player].on_safe_path
	return false

func force_state(new_state: HazardState):
	"""For testing: force hazard into specific state"""
	state_timer.stop()
	_transition_to(new_state)

func reset_cycle():
	"""Reset hazard to beginning of cycle"""
	cycle_count = 0
	state_timer.stop()
	_transition_to(HazardState.DORMANT)

func get_cycle_count() -> int:
	return cycle_count

func get_players_in_hazard() -> Array:
	return players_in_hazard.keys()
