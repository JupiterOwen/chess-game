"""
This script aims to manage the player with relative to its respective level
Speicifcally:
	1) Create new player at the beginning of the game
	2) Kill the player when died
	3) Remove all illegitable moves from the enemy's array by connecting it
	to a tilemap and being aware of other enemies in the enemypool
	3) Move the player depends on the StateMachine
"""
class_name PlayerManager
extends Node

@export var state_machine: StateMachine
@export var enemy_manager: EnemyManager
@export var board: Board

var player: Player   # Now it's not exported — it will always be instanced from the scene

const PLAYER_SCENE := preload("res://Scenes/player.tscn")

func _ready() -> void:
	player = PLAYER_SCENE.instantiate() as Player
	add_child(player)
	player.setup(Vector2(7, 7), "eKing", 3, ChessStats.Type.Player)
	# Setup player appearance and stats
	player.appearance.sprite_sheet_path = "res://Assets/WhitePiecesWood-Sheet.png"
	var stats := player.chess_stats
	
	#For testing purpose
	stats.update_ability("eKing", 1)
	stats.update_ability("eKnight", 1)
	stats.update_ability("eRook", 1)
	
	get_filtered_move()

	

func get_filtered_move() -> void:
	var possible_moves = player.movement.get_raw_moves()
	for move in possible_moves:
		if (move.x > board.MAX_X) or (move.y > board.MAX_Y) or (move.x < 0) or (move.y < 0):
			possible_moves.erase(move)
			
	for enemy in enemy_manager.enemy_pool:
		var enemy_pos = enemy.chess_stats.current_tile
		var player_pos = player.chess_stats.current_tile
		if enemy_pos in possible_moves:
			var distance_vector =  enemy_pos - player_pos
			var unit_vector = shrink_vector(distance_vector)
			possible_moves.erase(enemy_pos)
			for i in range(1, 100, 1):
				if player_pos + distance_vector + i * unit_vector in possible_moves:
					possible_moves.erase(player_pos + distance_vector + i * unit_vector)
				else: break
				
		else: continue
	player.chess_stats.move_set = possible_moves
	
func shrink_vector(vector: Vector2) -> Vector2:
	return Vector2(sign(vector.x), sign(vector.y))
