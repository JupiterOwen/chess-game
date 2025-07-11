class_name Player
extends Node2D

@onready var chess_stats: ChessStats = $ChessStatsComponent
@onready var movement: Movement = $MovementComponent
@onready var appearance: Appearance = $AppearanceComponent
@onready var area: Area = $AreaComponent
@onready var take_component: TakeComponent = $TakeComponent

@export var board: Board
@export var enemy_manager: EnemyManager

func setup(pos: Vector2, player_name: String, lvl: int, type: ChessStats.Type) -> void:
	if type == ChessStats.Type.Player:
		appearance.sprite_sheet_path = "res://Assets/WhitePiecesWood-Sheet.png"
	else:
		appearance.sprite_sheet_path = ChessData.chess_pieces[player_name].sprite_sheet_path
	chess_stats.chess_name = player_name
	chess_stats.current_tile = pos
	chess_stats.lvl = lvl
	chess_stats.type = type
	
	chess_stats.update_ability("eKing", 1)
	chess_stats.update_ability("eQueen", 3)
	
	appearance.setup()
	area.setup()

"""
Use to highlight chess piece and its possible moves whenever when it was hovered.
"""
func get_filtered_move() -> void:
	var possible_moves = movement.get_raw_moves()
	for move in possible_moves:
		if (move.x > board.MAX_X) or (move.y > board.MAX_Y) or (move.x < 0) or (move.y < 0):
			possible_moves.erase(move)
			
	for enemy in enemy_manager.enemy_pool:
		var enemy_pos = enemy.chess_stats.current_tile
		var player_pos = chess_stats.current_tile
		if enemy_pos in possible_moves:
			var distance_vector =  enemy_pos - player_pos
			var unit_vector = shrink_vector(distance_vector)
			possible_moves.erase(enemy_pos)
			for i in range(1, 100, 1):
				if player_pos + distance_vector + i * unit_vector in possible_moves:
					possible_moves.erase(player_pos + distance_vector + i * unit_vector)
				else: break
				
		else: continue
	chess_stats.move_set = possible_moves
	
func shrink_vector(vector: Vector2) -> Vector2:
	return Vector2(sign(vector.x), sign(vector.y))

func _on_area_component_mouse_entered() -> void:
	SignalBus.chessman_hovered.emit(self)
	print("Signal emitted!")

func _on_area_component_mouse_exited() -> void:
	SignalBus.chessman_unhovered.emit(self)
	print("Mouse exitted!")
