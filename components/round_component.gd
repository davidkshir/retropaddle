class_name RoundComponent
extends ObservableComponent

@export() var round: int:
	get:
		return _value
	set(value):
		_value = value
