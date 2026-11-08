class_name PlayerInput
extends Node

const SERVER_ID: int = 1

var ar_position: Vector2 = Vector2.ZERO

var backplane_wall: BackplaneWall

var paddle: Paddle

@onready var ar_view = $ARView


func _ready() -> void:
	if multiplayer.is_server():
		return

	if OS.has_feature("ios"):
		ar_view.backend = ARView.Backend.ARKIT
	else:
		ar_view.backend = ARView.Backend.ARCORE


func _physics_process(_delta: float) -> void:
	if multiplayer.is_server():
		return


@rpc("any_peer", "unreliable")
func _set_coordinates(position: Vector2) -> void:
	paddle.ar_position = position
