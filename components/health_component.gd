class_name HealthComponent
extends ObservableComponent

@export() var health: float:
	get:
		return _value
	set(value):
		_value = value
