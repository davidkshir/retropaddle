class_name TrackingDeltaComponent
extends ObservableComponent

@export() var tracking_delta: Vector2:
	get:
		return _value
	set(value):
		_value = value
