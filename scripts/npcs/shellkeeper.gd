class_name Shellkeeper
extends CharacterBody3D

signal interacted()

@export var quest_available: bool = true
@export var has_breathpearls: bool = false

@onready var interaction_area: Area3D = $InteractionArea
@onready var prompt_label: Label3D = $InteractionPrompt
@onready var quest_indicator: Node3D = $QuestIndicator
@onready var quest_indicator_mesh: MeshInstance3D = quest_indicator.get_node_or_null("IndicatorMesh") if quest_indicator else null

var _player_in_range: bool = false
var _current_player: Node = null

func _ready():
	set_process_unhandled_input(true)
	if interaction_area:
		interaction_area.body_entered.connect(_on_interaction_area_body_entered)
		interaction_area.body_exited.connect(_on_interaction_area_body_exited)
	_set_prompt_visible(false)
	_update_quest_indicator()

func _unhandled_input(event: InputEvent) -> void:
	if not _player_in_range:
		return
	if event.is_action_pressed("interact"):
		interact()
		get_viewport().set_input_as_handled()

func interact():
	interacted.emit()
	print("Shellkeeper interacted. Quest available:", quest_available, " | Breathpearls:", has_breathpearls)

func set_quest_available(value: bool) -> void:
	quest_available = value
	_update_quest_indicator()

func set_has_breathpearls(value: bool) -> void:
	has_breathpearls = value

func _on_interaction_area_body_entered(body: Node) -> void:
	if body is PlayerController:
		_player_in_range = true
		_current_player = body
		_set_prompt_visible(true)

func _on_interaction_area_body_exited(body: Node) -> void:
	if body == _current_player:
		_player_in_range = false
		_current_player = null
		_set_prompt_visible(false)

func _set_prompt_visible(visible: bool) -> void:
	if prompt_label:
		prompt_label.visible = visible

func _update_quest_indicator() -> void:
	if quest_indicator:
		quest_indicator.visible = quest_available
	if quest_indicator_mesh:
		quest_indicator_mesh.visible = quest_available
