class_name Movement 
extends Node2D

@export var chess_stats: ChessStats

"""
Function to retrieve all possible tiles for a chess piece to step on. Does not
care if there is other pieces on the board:
	1) The abilities in the ability pool: Rook, Queen, etc,
	2) The current poisition
"""
func get_raw_moves() -> Array[Vector2]:
	var ability_pool = chess_stats.abilities
	var place = chess_stats.current_tile
	var raw_moves: Array[Vector2] = []
	
	for ability in ability_pool:
		if not ChessData.chess_pieces.has(ability.piece):
			print("Chess piece not found: ", ability.piece)
			return []
		
		var piece_data = ChessData.chess_pieces[ability.piece]
		if piece_data.expandable == false: 
			for vector in piece_data.movement_set:
				var target_pos = place + vector
				if not target_pos in raw_moves:
					raw_moves.append(target_pos)
		else:
			for vector in piece_data.movement_set:
				for i in range(1, 100, 1):
					var target_pos = place + i * vector
					if not target_pos in raw_moves:
						raw_moves.append(target_pos)
	
	return raw_moves
