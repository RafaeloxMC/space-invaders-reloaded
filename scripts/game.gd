extends Node2D

@export var enemy: PackedScene

var reloading: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if !self.find_child("Player") && !reloading:
		reloading = true
		Engine.time_scale = 0.5
		await get_tree().create_timer(2).timeout
		Engine.time_scale = 1
		get_tree().reload_current_scene()
	
	if randi_range(0, 1000) == 999:
		var projectile = enemy.instantiate() as CharacterBody2D
		projectile.global_position = self.global_position
		projectile.position.y += 20
		self.add_sibling(projectile)
	
