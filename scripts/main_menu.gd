extends Control

@export var game_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !game_scene:
		print("WARNING: No game scene set!")
	pass # Replace with function body.

func _on_play_pressed() -> void:
	GameManager.score = 0
	GameManager.lives = 3
	get_tree().change_scene_to_packed(game_scene)

func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/options.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
