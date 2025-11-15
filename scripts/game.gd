extends Node2D

@export var enemy: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if randi_range(0, 10000) == 9999:
		print("Spawned")
		var projectile = enemy.instantiate() as CharacterBody2D
		projectile.global_position = self.global_position
		self.add_sibling(projectile)
