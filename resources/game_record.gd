class_name GameRecord
extends Resource

enum WinStates {
	STATE_NONE,

	STATE_DRAW,

	STATE_WIN,
}

var loser: Player = null

var win_state: WinStates = WinStates.STATE_NONE

var winner: Player = null
