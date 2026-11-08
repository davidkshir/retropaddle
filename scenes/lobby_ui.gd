extends Control


func _ready() -> void:
	visible = not OS.has_feature("mobile")
