class_name Board extends TileMap

@export var currently_hovered: Node2D
@export var enemy_manager: EnemyManager
@export var player: Player

const MAX_X = 32
const MAX_Y = 32

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.chessman_hovered.connect(_on_chessman_hovered)
	SignalBus.chessman_unhovered.connect(_on_chessman_unhovered)

"""
Function to draw all possible moves that the chess piece can acquired
"""
func draw_all_possible_moves(chessman) -> void:
	for coord in chessman.chess_stats.move_set:
		var center = Vector2(8 + 16 * (coord.x - 1), 6 + 12 * (coord.y - 1))
		var rect := ColorRect.new()
		if chessman is Enemy:
			rect.color = Color(219/255.0, 107/255.0, 107/255.0, 0.6) #red
		if chessman is Player:
			rect.color = Color(102/255.0, 255/255.0, 102/255.0, 0.6) #green
		rect.size = Vector2(4, 3)
		rect.position = center - rect.size / 2  # Top-left position
		add_child(rect)
	for coord in chessman.chess_stats.take_set + [chessman.chess_stats.current_tile]:
		var center = Vector2(8 + 16 * (coord.x - 1), 6 + 12 * (coord.y - 1))
		var rect := ColorRect.new()
		if chessman is Enemy:
			rect.color = Color(219/255.0, 107/255.0, 107/255.0, 0.6) #red
		if chessman is Player:
			rect.color = Color(102/255.0, 255/255.0, 102/255.0, 0.6) #green
		rect.size = Vector2(16, 12)
		rect.position = center - rect.size / 2  # Top-left position
		add_child(rect)

func erase_all_possible_moves() -> void:
	for child in get_children():
		if child is ColorRect:
			remove_child(child)
			child.queue_free()

func _on_chessman_hovered(chessman):
	if chessman == currently_hovered:
		return
	erase_all_possible_moves()
	draw_all_possible_moves(chessman)
	currently_hovered = chessman

func _on_chessman_unhovered(chessman):
	if chessman == currently_hovered:
		erase_all_possible_moves()
		currently_hovered = null
