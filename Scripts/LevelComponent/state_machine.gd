class_name StateMachine extends Node

@export var enemy_turn: bool = false
@export var enemy_turn_number = 0
@export var player_turn: bool = true
@export var player_turn_number = 0
@export var level_paused: bool = false
@export var level_ended: bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
