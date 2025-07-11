class_name Level1 extends Node2D

@onready var board: Board = $Board
@onready var enemy_manager: EnemyManager = $EnemyManager
@onready var difficulties_manager: DifficultiesManager = $DifficultiesManager
@onready var state_machine: StateMachine = $StateMachine
@onready var button: Button = $Button
@onready var take_management: TakeManagement = $TakeManagement
@onready var player: Player = $Player

func _ready() -> void:
	player.setup(Vector2(7, 7), "eKing", 3, ChessStats.Type.Player)
	player.get_filtered_move()

func _on_button_turn_changed() -> void:
	#When turn change from the Player to Enemy, do the following:
	# 1. Spawn new enemy waves.
	difficulties_manager.spawn_wave()
	
	# 2. Get filtered moves set from all the enemies and player
	for enemy in enemy_manager.enemy_pool:
		enemy_manager.get_filtered_move(enemy)
	player.get_filtered_move()
	print(player.chess_stats.move_set)
	
	# 3. Get filtered take_set from the enemies and player
	take_management.get_raw_take()
