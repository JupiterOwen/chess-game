extends Node

var chess_pieces = {
	"ePawn": {
		"movement_set": [
			Vector2(0, -1), Vector2(0, 1),
			Vector2(1, 0), Vector2(-1, 0)
		],
		"take_set": [
			Vector2(-1, -1), Vector2(1, 1), 
			Vector2(-1, 1), Vector2(1, -1)
		],
		"take_directory": "res://Scenes/Abstract/common_take_strategy.tscn",
		"expandable": false,
		"can_go_through": false,
		"sprite_sheet_path": "res://Assets/BlackPiecesWood-Sheet.png",
		"sprite": Rect2(0, 0, 16, 32)
	},
	"eRook": {
		"movement_set": [
			Vector2(1, 0), Vector2(-1, 0),
			Vector2(0, 1), Vector2(0, -1)
		],
		"take_set": [
			Vector2(1, 0), Vector2(-1, 0),
			Vector2(0, 1), Vector2(0, -1)
		],
		"take_directory": "res://Scenes/Abstract/common_take_strategy.tscn",
		"expandable": true,
		"can_go_through": false,
		"sprite_sheet_path": "res://Assets/BlackPiecesWood-Sheet.png",
		"sprite": Rect2(32, 0, 16, 32),
	},
	"eKnight": {
		"movement_set": [
			Vector2(1, 2), Vector2(2, 1),
			Vector2(-1, 2), Vector2(-2, 1),
			Vector2(1, -2), Vector2(2, -1),
			Vector2(-1, -2), Vector2(-2, -1)
		],
		"take_set": [
			Vector2(1, 2), Vector2(2, 1),
			Vector2(-1, 2), Vector2(-2, 1),
			Vector2(1, -2), Vector2(2, -1),
			Vector2(-1, -2), Vector2(-2, -1)
		],
		"take_directory": "res://Scenes/Abstract/common_take_strategy.tscn",
		"expandable": false,
		"can_go_through": true,
		"sprite_sheet_path": "res://Assets/BlackPiecesWood-Sheet.png",
		"sprite": Rect2(16, 0, 16, 32)
	},
	"eBishop": {
		"movement_set": [
			Vector2(1, 1), Vector2(-1, 1),
			Vector2(1, -1), Vector2(-1, -1)
		],
		"take_set": [
			Vector2(1, 1), Vector2(-1, 1),
			Vector2(1, -1), Vector2(-1, -1)
		],
		"take_directory": "res://Scenes/Abstract/common_take_strategy.tscn",
		"expandable": true,
		"can_go_through": false,
		"sprite_sheet_path": "res://Assets/BlackPiecesWood-Sheet.png",
		"sprite": Rect2(48, 0, 16, 32),
	},
	"eQueen": {
		"movement_set": [
			Vector2(1, 0), Vector2(-1, 0),
			Vector2(0, 1), Vector2(0, -1),
			Vector2(1, 1), Vector2(-1, 1),
			Vector2(1, -1), Vector2(-1, -1)
		],
		"take_set": [
			Vector2(1, 0), Vector2(-1, 0),
			Vector2(0, 1), Vector2(0, -1),
			Vector2(1, 1), Vector2(-1, 1),
			Vector2(1, -1), Vector2(-1, -1)
		],
		"take_directory": "res://Scenes/Abstract/common_take_strategy.tscn",
		"expandable": true,
		"can_go_through": false,
		"sprite_sheet_path": "res://Assets/BlackPiecesWood-Sheet.png",
		"sprite": Rect2(64, 0, 16, 32),
	},
	"eKing": {
		"name": "King",
		"movement_set": [
			Vector2(1, 0), Vector2(-1, 0),
			Vector2(0, 1), Vector2(0, -1),
			Vector2(1, 1), Vector2(-1, 1),
			Vector2(1, -1), Vector2(-1, -1)
		],
		"take_set": [
			Vector2(1, 0), Vector2(-1, 0),
			Vector2(0, 1), Vector2(0, -1),
			Vector2(1, 1), Vector2(-1, 1),
			Vector2(1, -1), Vector2(-1, -1)
		],
		"take_directory": "res://Scenes/Abstract/common_take_strategy.tscn",
		"expandable": false,
		"can_go_through": false,
		"sprite_sheet_path": "res://Assets/BlackPiecesWood-Sheet.png",
		"sprite": Rect2(80, 0, 16, 32),
	},
	
	#Chinese chess (Xiangqi goes here)
	"cCannon": {
		"name": "Cannon",
		"movement_set": [
			Vector2(1, 0), Vector2(-1, 0),
			Vector2(0, 1), Vector2(0, -1),
		],
		"take_set": [],
		"take_directory": "res://Scenes/Abstract/common_take_strategy.tscn",
		"expandable": false,
		"can_go_through": false,
		"sprite_sheet_path": "res://Assets/BlackPiecesWood-Sheet.png",
		"sprite": Rect2(80, 0, 16, 32),
	},
}
