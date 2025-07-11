class_name CommonTake
extends Node

"Check whether side A can take side B with the ability.
Return true: if takeable and else false
Parameter take-in: sideA's ability, sideA's position and sideB's position"
func check_take(ability: String, sideA: ChessStats, sideB: ChessStats) -> bool:
	var place = sideA.current_tile
	var position_vector = sideB.current_tile - place
	
	# Get the ability name in the Dictionary and check if SideB's
	# position is in the take_set of the ability. If ability is
	# exapandable (e.g. Queen, Rook), then shrink the vector to check
	var piece_data = ChessData.chess_pieces[ability]
	if piece_data.expandable == false: 
		if position_vector in piece_data.take_set:
			return true
	else:
		# Emit a signal containing position of two chess piece, counting how
		# many chess pieces are between them
		if shrink_vector(position_vector) in piece_data.take_set:
			return true
	
	return false

func shrink_vector(vector: Vector2) -> Vector2:
	if vector.x == vector.y or vector.x == 0 or vector.y == 0:
		return Vector2(sign(vector.x), sign(vector.y))
	else:
		return vector
