class_name Battlefield
extends Node3D

@onready var backplane_wall_1: BackplaneWall = $BackplaneWall1

@onready var backplane_wall_2: BackplaneWall = $BackplaneWall2

@onready var paddle_1: Paddle = $Paddle1

@onready var paddle_2: Paddle = $Paddle2

#backplane_wall = battlefield.backplane_wall_2 \
#if battlefield.backplane_wall_1.player else battlefield.backplane_wall_1
#
#paddle = battlefield.paddle_2 \
#if battlefield.paddle_1.player else battlefield.paddle_1
#
#backplane_wall.player = player
#paddle.player = player


func _ready() -> void:
	if not multiplayer.is_server():
		return

	RootScene.instance.lobby_manager.player_added.connect(_player_added)
	RootScene.instance.lobby_manager.player_removed.connect(_player_removed)


func _player_added(player: Player) -> void:
	pass


func _player_removed(player: Player) -> void:
	pass
