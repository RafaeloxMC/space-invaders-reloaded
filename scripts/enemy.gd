extends CharacterBody2D

@export var proj: PackedScene

func _physics_process(_delta: float) -> void:
	if randi_range(0, 1000) == 999:
		var projectile = proj.instantiate() as Area2D
		projectile.global_position = self.global_position
		projectile.rotation_degrees = 180
		self.add_sibling(projectile)
