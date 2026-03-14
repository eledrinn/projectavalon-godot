class_name QuestGatherTrigger
extends Area3D

## QuestGatherTrigger
## Detects player input within the Breathing Holes area and notifies the quest manager.

@export var quest_key: String = "quest_001"
@export var quest_item: String = "breathpearl"
@export var quest_location: String = "breathing_holes"
@export_range(1, 5, 1) var amount_per_gather: int = 1
@export var gather_time: float = 1.5
@export var prompt_label_path: NodePath

var _player_inside: bool = false
var _gather_in_progress: bool = false
var _quest_manager: QuestManager

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	set_process(true)

func _process(_delta: float) -> void:
	if not _player_inside:
		return
	if _gather_in_progress:
		return
	if not _quest_active():
		_update_prompt(false)
		return
	if Input.is_action_just_pressed("interact"):
		_begin_gather()

func _on_body_entered(body: Node) -> void:
	if body is PlayerController:
		_player_inside = true
		_update_prompt(true)

func _on_body_exited(body: Node) -> void:
	if body is PlayerController:
		_player_inside = false
		_update_prompt(false)

func _begin_gather() -> void:
	if not _quest_active():
		return
	_gather_in_progress = true
	_update_prompt(false)
	if gather_time > 0.0:
		var timer := get_tree().create_timer(gather_time)
		await timer.timeout
		if not _player_inside:
			_gather_in_progress = false
			return
	_register_gather()
	_gather_in_progress = false
	if _player_inside:
		_update_prompt(true)

func _register_gather() -> void:
	var manager := _get_manager()
	if manager and _quest_active():
		manager.register_gather(quest_item, quest_location, amount_per_gather)

func _quest_active() -> bool:
	var manager := _get_manager()
	if not manager:
		return false
	return manager.has_active_quest(quest_key)

func _get_manager() -> QuestManager:
	if _quest_manager and is_instance_valid(_quest_manager):
		return _quest_manager
	_quest_manager = get_tree().get_first_node_in_group("quest_manager") as QuestManager
	return _quest_manager

func _update_prompt(show: bool) -> void:
	if prompt_label_path.is_empty():
		return
	var label := get_node_or_null(prompt_label_path)
	if label:
		label.visible = show and not _gather_in_progress and _quest_active()
