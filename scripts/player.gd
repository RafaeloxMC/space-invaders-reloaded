extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	self.global_position = lerp(self.global_position, get_global_mouse_position(), 0.1)
	if(Input.is_action_pressed("attack")):
	move_and_slide()
