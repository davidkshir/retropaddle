class_name LobbyManager
extends Node

signal player_added(player: Player)

signal player_removed(player: Player)

var _players: Dictionary[Player, bool]

var players: Array[Player]:
	get:
		return _players.values()


func add_player(player: Player) -> void:
	if player not in _players:
		_players[player] = true

		player_added.emit(player)


func get_player_from_id(id: int) -> Player:
	for player in _players:
		if player.id == id:
			return player

	return null


func has_player(player: Player) -> bool:
	return player in _players


func remove_player(player: Player) -> bool:
	var did_remove = _players.erase(player)

	if did_remove:
		player_removed.emit(player)

	return did_remove
