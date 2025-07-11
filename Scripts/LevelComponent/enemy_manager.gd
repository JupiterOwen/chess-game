"""
This script aims to:
	1) Contains function to spawn enemy in patterns or singular
	2) Remove all illegitable moves from the enemy's array by connecting it
	to a tilemap and being aware of other enemies in the enemypool
"""
class_name EnemyManager extends Node

@export var enemy_pool: Array[Enemy]
@export var board: Board
@export var take_management: TakeManagement
@export var player: Player
const enemy = preload("res://Scenes/enemy.tscn")

"""Spawn singular enemy"""
func spawn(pos: Vector2, enemy_name: String, lvl: int, type: ChessStats.Type) -> Enemy:
	var new_enemy = enemy.instantiate() as Enemy
	add_child(new_enemy)
	new_enemy.setup(pos, enemy_name, lvl, type)
	
	var player_pos = player.chess_stats.current_tile
	var target_pos = Vector2((player_pos.x - 1)*80 + 40, (player_pos.y - 1)*60 + 30)
	new_enemy.appearance.ray_cast.target_position = target_pos
	var stats = new_enemy.chess_stats
	stats.update_ability(enemy_name, lvl)
	
	
	enemy_pool.append(new_enemy)
	return new_enemy

"""Function to delete illegal moves from raw_move array"""
func get_filtered_move(enemy_checked: Enemy) -> void:
	var possible_moves = enemy_checked.movement.get_raw_moves()
	for move in possible_moves:
		if (move.x > board.MAX_X) or (move.y > board.MAX_Y) or (move.x < 0) or (move.y < 0):
			possible_moves.erase(move)
	var enemy_pos = enemy_checked.chess_stats.current_tile
	var enemy_name = enemy_checked.chess_stats.chess_name
	var piece_data = ChessData.chess_pieces[enemy_name]
	
	for piece in enemy_pool + [player]:
		var other_pos = piece.chess_stats.current_tile
		if other_pos in possible_moves:
			if piece_data.expandable == false:
				possible_moves.erase(other_pos)
			else:
				var distance_vector =  other_pos - enemy_pos
				var unit_vector = shrink_vector(distance_vector)
				for i in range(0, 100, 1):
					if enemy_pos + distance_vector + i * unit_vector in possible_moves:
						possible_moves.erase(enemy_pos + distance_vector + i * unit_vector)
					else: break
		else: continue
	
	enemy_checked.chess_stats.move_set = possible_moves


func shrink_vector(vector: Vector2) -> Vector2:
	return Vector2(sign(vector.x), sign(vector.y))
