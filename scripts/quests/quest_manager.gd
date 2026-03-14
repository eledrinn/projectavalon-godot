class_name QuestManager
extends Node

## QuestManager
## Loads quest data, tracks active quest state, and emits signals for UI/trigger hooks.

signal quest_started(quest_key: String, quest_data: Dictionary)
signal objective_updated(quest_key: String, objective_index: int, objective_state: Dictionary)
signal quest_completed(quest_key: String, quest_data: Dictionary)

const QUEST_DATA_PATH := "res://resources/data/quests/native_starter_quests.json"

@export var auto_start_quest_key: String = ""

var quest_definitions: Dictionary = {}
var active_quests: Dictionary = {}
var completed_quests: Dictionary = {}

func _ready() -> void:
	load_quest_data()
	add_to_group("quest_manager")
	if not auto_start_quest_key.is_empty():
		start_quest(auto_start_quest_key)

func load_quest_data() -> void:
	quest_definitions.clear()
	if not FileAccess.file_exists(QUEST_DATA_PATH):
		push_warning("Quest data file not found: %s" % QUEST_DATA_PATH)
		return
	var json_text := FileAccess.get_file_as_string(QUEST_DATA_PATH)
	var json := JSON.new()
	var parse_error := json.parse(json_text)
	if parse_error != OK:
		push_warning("Quest data parse error (%s): %s" % [parse_error, json.get_error_message()])
		return
	var data = json.get_data()
	if data is Dictionary:
		quest_definitions = data
	else:
		push_warning("Quest data must be a Dictionary at root")

func get_quest_definition(quest_key: String) -> Dictionary:
	return quest_definitions.get(quest_key, {})

func has_active_quest(quest_key: String) -> bool:
	return active_quests.has(quest_key)

func is_quest_completed(quest_key: String) -> bool:
	return completed_quests.has(quest_key)

func start_quest(quest_key: String) -> void:
	if quest_key.is_empty():
		return
	if not quest_definitions.has(quest_key):
		push_warning("Quest not found: %s" % quest_key)
		return
	if has_active_quest(quest_key):
		return
	if not _prerequisites_met(quest_key):
		push_warning("Quest prerequisites not met for %s" % quest_key)
		return
	var quest_data: Dictionary = quest_definitions[quest_key]
	active_quests[quest_key] = {
		"definition": quest_data,
		"objectives": _initialize_objectives(quest_data),
		"completed": false
	}
	emit_signal("quest_started", quest_key, quest_data)

func _prerequisites_met(quest_key: String) -> bool:
	var quest_data: Dictionary = quest_definitions.get(quest_key, {})
	var prerequisites: Array = quest_data.get("prerequisites", [])
	for prerequisite in prerequisites:
		var key := String(prerequisite)
		if key.is_empty():
			continue
		if not is_quest_completed(key):
			return false
	return true

func _initialize_objectives(quest_data: Dictionary) -> Array:
	var objective_defs: Array = quest_data.get("objectives", [])
	var states: Array = []
	for def in objective_defs:
		if not (def is Dictionary):
			continue
		var target: int = int(def.get("count", 1))
		states.append({
			"type": def.get("type", ""),
			"target": max(target, 1),
			"progress": 0,
			"completed": false,
			"definition": def
		})
	return states

func register_gather(item: String, location: String = "", amount: int = 1) -> void:
	for quest_id in active_quests.keys():
		var quest_state: Dictionary = active_quests[quest_id]
		var objective_defs: Array = quest_state["definition"].get("objectives", [])
		for i in range(objective_defs.size()):
			var def: Dictionary = objective_defs[i]
			if def.get("type", "") != "gather":
				continue
			if def.get("item", "") != item:
				continue
			var required_location := String(def.get("location", ""))
			if not required_location.is_empty() and required_location != location:
				continue
			_increment_objective(quest_id, i, amount)

func register_delivery(target: String, location: String = "") -> void:
	for quest_id in active_quests.keys():
		var quest_state: Dictionary = active_quests[quest_id]
		var objective_defs: Array = quest_state["definition"].get("objectives", [])
		for i in range(objective_defs.size()):
			var def: Dictionary = objective_defs[i]
			if def.get("type", "") != "deliver":
				continue
			var required_target := String(def.get("target", ""))
			if not required_target.is_empty() and required_target != target:
				continue
			var required_location := String(def.get("location", ""))
			if not required_location.is_empty() and required_location != location:
				continue
			_increment_objective(quest_id, i, 1)

func _increment_objective(quest_id: String, objective_index: int, amount: int) -> void:
	if not active_quests.has(quest_id):
		return
	var quest_state: Dictionary = active_quests[quest_id]
	var objectives: Array = quest_state["objectives"]
	if objective_index < 0 or objective_index >= objectives.size():
		return
	var state: Dictionary = objectives[objective_index]
	if state.get("completed", false):
		return
	state["progress"] = clamp(state.get("progress", 0) + amount, 0, state.get("target", 1))
	if state["progress"] >= state.get("target", 1):
		state["completed"] = true
	emit_signal("objective_updated", quest_id, objective_index, state.duplicate(true))
	if _are_all_objectives_complete(quest_state):
		_complete_quest(quest_id)

func _are_all_objectives_complete(quest_state: Dictionary) -> bool:
	for state in quest_state.get("objectives", []):
		if not state.get("completed", false):
			return false
	return true

func _complete_quest(quest_id: String) -> void:
	if not active_quests.has(quest_id):
		return
	var quest_state: Dictionary = active_quests[quest_id]
	quest_state["completed"] = true
	completed_quests[quest_id] = quest_state
	active_quests.erase(quest_id)
	var quest_data: Dictionary = quest_state.get("definition", {})
	emit_signal("quest_completed", quest_id, quest_data)

func get_active_quest_states() -> Dictionary:
	return active_quests.duplicate(true)

func get_objective_state(quest_key: String, objective_index: int) -> Dictionary:
	if not active_quests.has(quest_key):
		return {}
	var objectives: Array = active_quests[quest_key].get("objectives", [])
	if objective_index < 0 or objective_index >= objectives.size():
		return {}
	return objectives[objective_index].duplicate(true)
