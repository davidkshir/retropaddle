class_name Paddle
extends Node3D
const WALL_HALF_EXTENTS: Vector2 = Vector2(1.0, 1.0) # 2m x 2m backplane wall centered at half

var _player: Player = null

var player: Player:
	get:
		return _player
	set(value):
		var old_player = _player
		_player = value

		_player_changed(old_player, value)

var ar_position: Vector2

@onready var _initial_position: Vector3 = position
@onready var camera_3d: Camera3D = %Camera3D


func _player_changed(_old_player: Player, new_player: Player) -> void:
	if multiplayer.is_server():
		return

	var id = multiplayer.get_unique_id()
	var player = RootScene.instance.lobby_manager.get_player_from_id(id)

	camera_3d.current = player == new_player


func _physics_process(_delta: float) -> void:
	if not multiplayer.is_server() or player == null:
		return

	var tracking_delta = player.tracking_delta.tracking_delta

	var target_x = clampf(
		_initial_position.x + (tracking_delta.x * WALL_HALF_EXTENTS.x),
		_initial_position.x - WALL_HALF_EXTENTS.x,
		_initial_position.x + WALL_HALF_EXTENTS.x,
	)

	var target_y = clampf(
		_initial_position.y + (tracking_delta.y * WALL_HALF_EXTENTS.y),
		_initial_position.y - WALL_HALF_EXTENTS.y,
		_initial_position.y + WALL_HALF_EXTENTS.y,
	)

	position = Vector3(target_x, target_y, _initial_position.z)