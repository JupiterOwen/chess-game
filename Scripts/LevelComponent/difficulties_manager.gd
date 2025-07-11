class_name DifficultiesManager extends Node

@export var enemy_manager: EnemyManager

# Called when the node enters the scene tree for the first time.
func spawn_wave() -> void:
	enemy_manager.spawn(Vector2(5,5), "eKing", 3, ChessStats.Type.FinalBoss)
	enemy_manager.spawn(Vector2(5,6), "eQueen", 3, ChessStats.Type.Enemy)
	enemy_manager.spawn(Vector2(7,6), "eKnight", 3, ChessStats.Type.GreatEnemy)
	enemy_manager.spawn(Vector2(7,5), "eRook", 3, ChessStats.Type.Enemy)
	enemy_manager.spawn(Vector2(4,4), "eBishop", 3, ChessStats.Type.Enemy)
	enemy_manager.spawn(Vector2(9,9), "eBishop", 3, ChessStats.Type.Enemy)
	
