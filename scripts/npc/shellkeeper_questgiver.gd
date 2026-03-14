class_name ShellkeeperQuestGiver
extends Area3D

## ShellkeeperQuestGiver
## Simple interact volume that starts the Native Starter quest when the player presses Interact (E).

@export var quest_key: String = "quest_001"
@export var prompt_label_path: NodePath

var _quest_manager: QuestManager
var _player_inside: bool = false

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	set_process(true)

func _process(_delta: float) -> void:
	if not _player_inside:
		return
	if Input.is_action_just_pressed("interact"):
		_start_quest()

func _on_body_entered(body: Node) -> void:
	if body is PlayerController:
		_player_inside = true
		_update_prompt_visibility()

func _on_body_exited(body: Node) -> void:
	if body is PlayerController:
		_player_inside = false
		_update_prompt_visibility()

func _start_quest() -> void:
	var manager := _get_manager()
	if not manager:
		return
	if manager.has_active_quest(quest_key) or manager.is_quest_completed(quest_key):
		return
	manager.start_quest(quest_key)
	_update_prompt_visibility()

func _get_manager() -> QuestManager:
	if _quest_manager and is_instance_valid(_quest_manager):
		return _quest_manager
	_quest_manager = get_tree().get_first_node_in_group("quest_manager") as QuestManager
	return _quest_manager

func _update_prompt_visibility() -> void:
	if prompt_label_path.is_empty():
		return
	var label := get_node_or_null(prompt_label_path)
	if not label:
		return
	var manager := _get_manager()
	var quest_available := manager and not manager.has_active_quest(quest_key) and not manager.is_quest_completed(quest_key)
	label.visible = _player_inside and quest_available
