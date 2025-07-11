class_name Appearance extends CharacterBody2D

@onready var appearance: Sprite2D = $Appearance
@onready var ray_cast: RayCast2D = $RayCast2D

@export var chess_stats: ChessStats
@export var sprite_sheet_path: String
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

"""
Function to solely draw a piece of chess in the game (both enemy and player). Args:
	1) The piece name: Rook, Queen, etc,
	2) The position: a vector2(x, y) of the current tile on the chessboard.
	3) Multiplier: Scale the image up. For boss = 4 or 5, for normal enemy = 3
"""
func setup() -> void:
	Control.MOUSE_FILTER_IGNORE
	position = Vector2(40 + (chess_stats.current_tile.x - 1)* 80, \
					   30 + (chess_stats.current_tile.y - 1)* 60)
	draw()
	z_index = int(chess_stats.current_tile.y) + 1
	print(collision_shape_2d.shape.radius)
	

func draw() -> void:
	var multiplier = float(chess_stats.type) / 2
	
	# Check if the piece name exists in the database
	if not ChessData.chess_pieces.has(chess_stats.chess_name):
		print("Chess piece not found: ", chess_stats.chess_name)
		return

	# Retrieving sprite zone based on the information given
	var piece_data = ChessData.chess_pieces[chess_stats.chess_name]
	var sprite_rect = piece_data["sprite"]
	
	# Getting the sprite
	var atlas_texture = AtlasTexture.new()
	atlas_texture.atlas = load(sprite_sheet_path)
	atlas_texture.region = sprite_rect
	# Apply the atlas texture to this sprite
	appearance.texture = atlas_texture
	scale = Vector2(1 * multiplier, 1 * multiplier)
	
	appearance.position.y = -12
	
	
