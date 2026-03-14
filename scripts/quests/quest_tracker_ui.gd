class_name QuestTrackerUI
extends CanvasLayer

## QuestTrackerUI
## Minimal UI readout for current quest objectives.

@export var objectives_label_path: NodePath

var _quest_manager: QuestManager

func _ready() -> void:
	_connect_manager()
	_refresh_display()

func _connect_manager() -> void:
	var manager := _get_manager()
	if not manager:
		return
	manager.quest_started.connect(_on_state_changed)
	manager.objective_updated.connect(_on_objective_changed)
	manager.quest_completed.connect(_on_state_changed)

func _on_state_changed(_quest_key: String, _data: Dictionary) -> void:
	_refresh_display()

func _on_objective_changed(_quest_key: String, _objective_index: int, _state: Dictionary) -> void:
	_refresh_display()

func _refresh_display() -> void:
	var label := _get_label()
	if not label:
		return
	var manager := _get_manager()
	if not manager:
		label.text = "Quest system unavailable"
		return
	var active := manager.get_active_quest_states()
	if active.is_empty():
		label.text = "No active quests\nPress E near the Shellkeeper."
		return
	var lines: Array[String] = []
	for quest_id in active.keys().sorted():
		var quest_state: Dictionary = active[quest_id]
		var quest_def: Dictionary = quest_state.get("definition", {})
		lines.append("[b]%s[/b]" % quest_def.get("title", quest_id))
		var objectives: Array = quest_def.get("objectives", [])
		var states: Array = quest_state.get("objectives", [])
		for i in range(min(objectives.size(), states.size())):
			lines.append(_format_objective_line(objectives[i], states[i]))
	label.bbcode_enabled = true
	label.text = "\n".join(lines)

func _format_objective_line(definition: Dictionary, state: Dictionary) -> String:
	var type := definition.get("type", "")
	var description := definition.get("description", "")
	var location := definition.get("location", "")
	var progress := state.get("progress", 0)
	var target := state.get("target", 1)
	if description == "" and type == "gather":
		description = "Gather %s" % definition.get("item", "items")
	elif description == "" and type == "deliver":
		description = "Deliver to %s" % definition.get("target", "target")
	var suffix := ""
	if location != "":
		suffix = " (%s)" % location
	return " • %s: %d/%d%s" % [description, progress, target, suffix]

func _get_label() -> RichTextLabel:
	if objectives_label_path.is_empty():
		return null
	return get_node_or_null(objectives_label_path) as RichTextLabel

func _get_manager() -> QuestManager:
	if _quest_manager and is_instance_valid(_quest_manager):
		return _quest_manager
	_quest_manager = get_tree().get_first_node_in_group("quest_manager") as QuestManager
	return _quest_manager
