class_name GameManager
extends Node3D

## GameManager
## Central game state manager for Project Avalon
## Handles scene loading, player state, and global systems

signal player_spawned(player: CharacterBody3D)
signal region_loaded(region_name: String)
signal region_unloaded(region_name: String)

@onready var player: CharacterBody3D = $Player
@onready var streaming_manager: Node = $StreamingManager

var current_region: String = ""
var player_level: int = 1
var game_time: float = 0.0

func _ready():
	print("Project Avalon: GameManager initialized")
	_setup_player()
	_connect_signals()

func _process(delta: float):
	game_time += delta
	_update_streaming()

func _setup_player():
	if player:
		player.global_position = $PlayerSpawn.global_position
		player_spawned.emit(player)
		print("Player spawned at: ", player.global_position)

func _connect_signals():
	if streaming_manager:
		streaming_manager.region_loaded.connect(_on_region_loaded)
		streaming_manager.region_unloaded.connect(_on_region_unloaded)

func _update_streaming():
	# Update streaming based on player position
	if player and streaming_manager:
		streaming_manager.update_player_position(player.global_position)

func _on_region_loaded(region_name: String):
	current_region = region_name
	region_loaded.emit(region_name)
	print("Region loaded: ", region_name)

func _on_region_unloaded(region_name: String):
	region_unloaded.emit(region_name)
	print("Region unloaded: ", region_name)

func get_player_position() -> Vector3:
	if player:
		return player.global_position
	return Vector3.ZERO

func teleport_player_to(position: Vector3):
	if player:
		player.global_position = position
		print("Player teleported to: ", position)
