class_name StreamingManager
extends Node

## StreamingManager
## Custom world streaming system for Project Avalon
## Replaces UE5 World Partition with Godot-native implementation

signal region_loaded(region_name: String)
signal region_unloaded(region_name: String)
signal chunk_loaded(chunk_coords: Vector2i)
signal chunk_unloaded(chunk_coords: Vector2i)

@export var streaming_radius: float = 256.0  ## meters
@export var chunk_size: float = 128.0        ## meters per chunk
@export var max_loaded_chunks: int = 16

var loaded_chunks: Dictionary = {}  ## Vector2i -> ChunkData
var player_chunk: Vector2i = Vector2i.ZERO
var regions: Dictionary = {}        ## Region name -> RegionData

class ChunkData:
	var coords: Vector2i
	var world_position: Vector3
	var loaded: bool = false
	var load_time: float = 0.0
	var scene_instance: Node3D = null
	
	func _init(c: Vector2i, cs: float):
		coords = c
		world_position = Vector3(c.x * cs, 0, c.y * cs)

func _ready():
	print("StreamingManager initialized")
	print("Chunk size: ", chunk_size, "m, Streaming radius: ", streaming_radius, "m")

func update_player_position(player_pos: Vector3):
	var new_chunk = _world_to_chunk(player_pos)
	
	if new_chunk != player_chunk:
		player_chunk = new_chunk
		_update_streaming_chunks()

func _world_to_chunk(world_pos: Vector3) -> Vector2i:
	return Vector2i(
		floor(world_pos.x / chunk_size),
		floor(world_pos.z / chunk_size)
	)

func _update_streaming_chunks():
	var chunks_to_load: Array[Vector2i] = []
	var chunks_in_radius: Array[Vector2i] = []
	
	# Calculate chunks within streaming radius
	var radius_in_chunks = ceil(streaming_radius / chunk_size)
	
	for x in range(-radius_in_chunks, radius_in_chunks + 1):
		for y in range(-radius_in_chunks, radius_in_chunks + 1):
			var chunk = player_chunk + Vector2i(x, y)
			var distance = Vector2(chunk.x - player_chunk.x, chunk.y - player_chunk.y).length()
			
			if distance <= radius_in_chunks:
				chunks_in_radius.append(chunk)
				if not loaded_chunks.has(chunk):
					chunks_to_load.append(chunk)
	
	# Unload chunks outside radius
	var chunks_to_unload: Array[Vector2i] = []
	for chunk in loaded_chunks.keys():
		if not chunk in chunks_in_radius:
			chunks_to_unload.append(chunk)
	
	# Execute loads and unloads
	for chunk in chunks_to_load:
		_load_chunk(chunk)
	
	for chunk in chunks_to_unload:
		_unload_chunk(chunk)

func _load_chunk(coords: Vector2i):
	if loaded_chunks.has(coords):
		return
	
	var chunk = ChunkData.new(coords, chunk_size)
	chunk.loaded = true
	chunk.load_time = Time.get_time_dict_from_system()["second"]
	loaded_chunks[coords] = chunk
	
	# TODO: Actually load scene content here
	# For now, just spawn a placeholder
	var placeholder = MeshInstance3D.new()
	placeholder.mesh = BoxMesh.new()
	placeholder.mesh.size = Vector3(chunk_size * 0.9, 1, chunk_size * 0.9)
	placeholder.global_position = chunk.world_position + Vector3(chunk_size/2, 0, chunk_size/2)
	placeholder.name = "Chunk_" + str(coords.x) + "_" + str(coords.y)
	placeholder.visible = false  # Debug: set to true to see chunks
	chunk.scene_instance = placeholder
	
	get_tree().current_scene.add_child(placeholder)
	
	chunk_loaded.emit(coords)
	print("Loaded chunk: ", coords, " at ", chunk.world_position)

func _unload_chunk(coords: Vector2i):
	if not loaded_chunks.has(coords):
		return
	
	var chunk = loaded_chunks[coords]
	
	if chunk.scene_instance:
		chunk.scene_instance.queue_free()
	
	loaded_chunks.erase(coords)
	chunk_unloaded.emit(coords)
	print("Unloaded chunk: ", coords)

func get_loaded_chunk_count() -> int:
	return loaded_chunks.size()

func is_chunk_loaded(coords: Vector2i) -> bool:
	return loaded_chunks.has(coords)

func get_chunk_world_position(coords: Vector2i) -> Vector3:
	return Vector3(coords.x * chunk_size, 0, coords.y * chunk_size)
