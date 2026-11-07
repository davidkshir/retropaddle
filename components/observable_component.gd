class_name ObservableComponent
extends Node

signal changed(new_value: Variant)

var _value: Variant:
	set(value):
		if _value != value:
			_value = value
			changed.emit(value)
