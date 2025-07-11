class_name ChessStats extends Node2D

enum Type {Player = 8, Enemy = 7, GreatEnemy = 8, FinalBoss = 10}

@export var chess_name: String
@export var current_tile: Vector2
@export var type: Type = Type.Enemy
@export var lvl: int
@export var move_set: Array[Vector2]
@export var take_set: Array[Vector2]

# Expected format: [{ "piece": String, "lvl": int }, ...]
@export var abilities: Array[Dictionary] = []

func update_ability(target_piece: String, increment: int) -> void:
	for ability in abilities:
		if ability["piece"] == target_piece:
			ability["lvl"] += increment
			ability["lvl"] = clamp(ability["lvl"], 1, 3)

			if ability["lvl"] < 1:
				abilities.erase(ability)
				print(target_piece, "ability removed")
			else:
				print(target_piece, "updated to level", ability["lvl"])
			return

	if increment > 0:
		var new_level = clamp(increment, 1, 3)
		abilities.append({ "piece": target_piece, "lvl": new_level })
		print(target_piece, "added at level", new_level)
	else:
		print(target_piece, "not found and cannot be downgraded")
