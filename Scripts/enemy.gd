class_name Enemy extends Node2D

@onready var appearance: Appearance = $AppearanceComponent
@onready var movement: Movement = $MovementComponent
@onready var chess_stats: ChessStats = $ChessStatsComponent
@onready var area: Area = $AreaComponent
@onready var take_component: TakeComponent = $TakeComponent

"""Function to set up a new enemy, excluding its type (boss or not)
and ability"""
func setup(pos: Vector2, enemy_name: String, lvl: int, type: ChessStats.Type) -> void:
	appearance.sprite_sheet_path = ChessData.chess_pieces[enemy_name].sprite_sheet_path
	chess_stats.chess_name = enemy_name
	chess_stats.current_tile = pos
	chess_stats.lvl = lvl
	chess_stats.type = type

	appearance.setup()
	area.setup()
