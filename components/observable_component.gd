class_name ObservableComponent
extends Node

signal changed(new_value: Variant)

var _initial_value: Variant = null

var _value: Variant:
	set(value):
		if _value != value:
			_value = value
			changed.emit(value)


func _init() -> void:
	_initial_value = _value


func reset() -> void:
	_value = _initial_value
