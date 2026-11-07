extends Camera3D

@export var ar_view: ARView


func _process(delta):
	global_rotation = ar_view.camera.global_rotation
	rotation_degrees.y += 180
