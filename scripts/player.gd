extends CharacterBody2D

@export var proj: PackedScene

func _physics_process(_delta: float) -> void:
	var lerped: Vector2 = lerp(self.global_position, get_global_mouse_position(), 0.1)
	self.global_position.x = clamp(lerped.x, 0, 1152)
	self.global_position.y = clamp(lerped.y, 0, 648)
	if(Input.is_action_pressed("attack")):
		var projectile = proj.instantiate() as Area2D
		projectile.global_position = self.global_position
		projectile.position.y -= 50
		self.add_sibling(projectile)
		pass
	move_and_slide()
	
func _process(_delta: float) -> void:
	if self.is_queued_for_deletion():
		print("GAME OVER")
