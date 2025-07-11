class_name TakeManagement
extends Node

@export var enemy_manager: EnemyManager
@export var player: Player


func get_raw_take() -> void:
	#get raw take
	for enemy in enemy_manager.enemy_pool:
		enemy.take_component.check_take(player.chess_stats)
		print(enemy.chess_stats.take_set)
		player.take_component.check_take(enemy.chess_stats)
	print(player.chess_stats.take_set)
	#filtered
	for enemy in enemy_manager.enemy_pool:
		pass

func _on_check_go_through(itself, opposition) -> void:
	var count = 0
	var position_vector = opposition.current_tile - itself.current_tile
	var unit = shrink_vector(position_vector)
	for i in range(1, position_vector.length()/unit.length() - 1, 1):
		for enemy in enemy_manager.enemy_pool:
			if enemy.chess_stats.current_tile == opposition.current_tile - i*unit:
				count = count + 1
				print(count)
	SignalBus.return_go_through.emit(count)

func shrink_vector(vector: Vector2) -> Vector2:
	if vector.x == vector.y or vector.x == 0 or vector.y == 0:
		return Vector2(sign(vector.x), sign(vector.y))
	else:
		return vector
