extends Button

@export var state: StateMachine
signal Turn_Changed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

"""A button to test out enemy_turn"""

func _on_pressed() -> void:
	if state.enemy_turn:
		state.player_turn = true
		state.player_turn_number += 1
		state.enemy_turn = false
	else:
		state.player_turn = false
		state.enemy_turn = true
		state.enemy_turn_number += 1
	print("Player turn = " + str(state.player_turn_number) + " Enemy turn: "+str(state.enemy_turn_number))
	Turn_Changed.emit()
