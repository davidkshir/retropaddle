class_name GameStateComponent
extends ObservableComponent

enum GameState {
	STATE_PLAYING,

	STATE_ENDED,
}

@export() var game_state: GameState:
	get:
		return _value
	set(value):
		_value = value


func _init(initial_value: GameState = GameState.STATE_PLAYING) -> void:
	super(initial_value)
