extends Node2D

@export var enemy: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if randi_range(0, 1000) == 999:
		var projectile = enemy.instantiate() as CharacterBody2D
		projectile.global_position = self.global_position
		projectile.position.y += 20
		self.add_sibling(projectile)
