class_name QuestCompletionTrigger
extends Area3D

## QuestCompletionTrigger
## Checks quest state when the player reaches the Waymarker and finalizes delivery objectives.

@export var quest_key: String = "quest_001"
@export var delivery_target: String = "shellkeeper"
@export var delivery_location: String = "shellmound"
@export var require_gather_complete: bool = true

var _quest_manager: QuestManager
var _triggered: bool = false

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if _triggered:
		return
	if not (body is PlayerController):
		return
	var manager := _get_manager()
	if not manager:
		return
	if not manager.has_active_quest(quest_key):
		return
	if require_gather_complete and not _gather_objectives_done(manager):
		return
	manager.register_delivery(delivery_target, delivery_location)
	_triggered = true

func _gather_objectives_done(manager: QuestManager) -> bool:
	var quest_data := manager.get_quest_definition(quest_key)
	var objectives: Array = quest_data.get("objectives", [])
	for index in range(objectives.size()):
		var def: Dictionary = objectives[index]
		if def.get("type", "") != "gather":
			continue
		var state := manager.get_objective_state(quest_key, index)
		if state.is_empty() or not state.get("completed", false):
			return false
	return true

func _get_manager() -> QuestManager:
	if _quest_manager and is_instance_valid(_quest_manager):
		return _quest_manager
	_quest_manager = get_tree().get_first_node_in_group("quest_manager") as QuestManager
	return _quest_manager
