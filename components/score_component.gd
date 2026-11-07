class_name ScoreComponent
extends ObservableComponent

@export() var score: float:
	get:
		return _value
	set(value):
		_value = value
