class_name QuestIndicator
extends Label3D

## QuestIndicator
## Displays a floating "!" when a quest is available.

@export var quest_key: String = "quest_001"
@export var available_text: String = "!"
@export var completed_text: String = ""

var _quest_manager: QuestManager

func _ready() -> void:
	text = available_text
	_connect_to_manager()
	_update_visibility()

func _connect_to_manager() -> void:
	var manager := _get_manager()
	if not manager:
		return
	manager.quest_started.connect(_on_quest_started)
	manager.quest_completed.connect(_on_quest_completed)

func _on_quest_started(started_key: String, _data: Dictionary) -> void:
	if started_key == quest_key:
		_update_visibility()

func _on_quest_completed(completed_key: String, _data: Dictionary) -> void:
	if completed_key == quest_key:
		if not completed_text.is_empty():
			text = completed_text
		_update_visibility()

func _update_visibility() -> void:
	var manager := _get_manager()
	if not manager:
		return
	var available := not manager.has_active_quest(quest_key) and not manager.is_quest_completed(quest_key)
	visible = available

func _get_manager() -> QuestManager:
	if _quest_manager and is_instance_valid(_quest_manager):
		return _quest_manager
	_quest_manager = get_tree().get_first_node_in_group("quest_manager") as QuestManager
	return _quest_manager
