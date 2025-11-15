extends CharacterBody2D

@export var proj: PackedScene

func _physics_process(_delta: float) -> void:
	self.global_position = lerp(self.global_position, get_global_mouse_position(), 0.1)
	if(Input.is_action_pressed("attack")):
		var projectile = proj.instantiate() as Area2D
		projectile.global_position = self.global_position
		projectile.position.y -= 20
		self.add_sibling(projectile)
		pass
	move_and_slide()
