class_name Area extends Control

@export var chess_stats: ChessStats

func setup() -> void:
	size = Vector2(80, 60)
	var pos = chess_stats.current_tile
	position = Vector2((pos.x - 1) * 80, (pos.y - 1) * 60)


func _on_mouse_exited() -> void:
	SignalBus.chessman_unhovered.emit(get_parent())


func _on_mouse_entered() -> void:
	SignalBus.chessman_hovered.emit(get_parent())
