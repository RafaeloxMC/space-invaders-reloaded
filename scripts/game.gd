extends Node2D

@onready var score: Label = $Environment/Score
@onready var lives: Label = $Environment/Control/Lives

@export var enemy: PackedScene

var reloading: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Engine.time_scale = GameManager.game_speed
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if !self.find_child("Player") && !reloading:
		reloading = true
		GameManager.remove_life()
		Engine.time_scale = 0.5
		await get_tree().create_timer(2).timeout
		Engine.time_scale = GameManager.game_speed
		if GameManager.lives <= 0:
			get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
		else:
			get_tree().reload_current_scene()
		return
	
	score.text = "Score " + str(GameManager.score)
	lives.text = str(GameManager.lives) + " Lives"
	
	if randi_range(0, 1000) >= 995:
		var projectile = enemy.instantiate() as CharacterBody2D
		projectile.global_position = self.global_position
		projectile.position.y += 20
		self.add_child(projectile)
	
