class_name RegionManager
extends Node3D

## RegionManager
## Manages a single region/world partition
## Handles local content loading, landmarks, and region-specific systems

@export var region_name: String = "Unnamed Region"
@export var region_bounds: AABB
@export var is_active: bool = true

@onready var landmarks: Node3D = $Landmarks
@onready var terrain: Node3D = $Terrain
@onready var props: Node3D = $Props
@onready var systems: Node3D = $Systems

var loaded: bool = false
var player_in_region: bool = false

func _ready():
	print("Region initialized: ", region_name)
	_setup_landmarks()

func _setup_landmarks():
	# Landmark positions can be read from data files by agents
	# For now, using scene-defined positions
	for landmark in landmarks.get_children():
		if landmark is Marker3D:
			print("Landmark registered: ", landmark.name, " at ", landmark.global_position)

func get_spawn_point() -> Vector3:
	var hearthroot = landmarks.get_node_or_null("HearthrootSpawn")
	if hearthroot:
		return hearthroot.global_position
	return global_position

func get_landmark_position(landmark_name: String) -> Vector3:
	var landmark = landmarks.get_node_or_null(landmark_name)
	if landmark:
		return landmark.global_position
	push_warning("Landmark not found: " + landmark_name)
	return Vector3.ZERO

func is_point_in_region(point: Vector3) -> bool:
	return region_bounds.has_point(point - global_position)

func on_player_entered():
	player_in_region = true
	print("Player entered region: ", region_name)
	# Activate region systems

func on_player_exited():
	player_in_region = false
	print("Player exited region: ", region_name)
	# Deactivate region systems

func get_region_data() -> Dictionary:
	return {
		"name": region_name,
		"bounds": region_bounds,
		"landmarks": _get_landmarks_data()
	}

func _get_landmarks_data() -> Dictionary:
	var data = {}
	for landmark in landmarks.get_children():
		if landmark is Marker3D:
			data[landmark.name] = {
				"position": [landmark.global_position.x, landmark.global_position.y, landmark.global_position.z]
			}
	return data
