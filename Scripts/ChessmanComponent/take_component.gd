class_name TakeComponent
extends Node2D

@export var chess_stats: ChessStats
@export var chess_in_between: int = 0
"""
This function will be called in TakeManagement ina specific
opposition or not with the current ability pool.

Since the chess piece's position can be accessed through
the peer's chess_stats, its only accepting parameters here 
is the opposition's position.

I.e., if the function is called for player, then the parameter
will be enemy's position
"""
func check_take(opposition_stats: ChessStats) -> void:
	var ability_pool = chess_stats.abilities
	
	for ability in ability_pool:
		var piece_name = chess_stats.chess_name
		var data = ChessData.chess_pieces[piece_name]
		var take_directory = load(data.take_directory)
		var take = take_directory.instantiate()
		add_child(take)
		
		var can_take = await take.check_take(ability.piece, chess_stats, opposition_stats)
		if can_take and not (opposition_stats.current_tile in chess_stats.take_set):
			chess_stats.take_set.append(opposition_stats.current_tile)
