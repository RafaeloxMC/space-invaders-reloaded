extends CharacterBody2D

@export var speed: float = 120.0
@export var change_dir_min: float = 2.0
@export var change_dir_max: float = 8.0
@export var proj: PackedScene

var _direction: float = 1.0
var _timer: float = 0.0
var _camera: Camera2D
var _half_width: float

func _ready() -> void:
	_camera = get_viewport().get_camera_2d()
	_half_width = _camera.get_viewport_rect().size.x * 0.5 if _camera else 1152.0 / 2
	_reset_timer()
	self.position.x = randf_range(0, _camera.get_viewport_rect().size.x if _camera else 1152.0)

func _physics_process(delta: float) -> void:
	_timer -= delta
	if _timer <= 0.0:
		_direction = -_direction
		_reset_timer()

	velocity.x = _direction * speed
	move_and_slide()

	if _camera:
		var cam_pos := _camera.global_position.x
		var left := cam_pos - _half_width
		var right := cam_pos + _half_width
		if global_position.x < left:
			global_position.x = left
			_direction = 1.0
		elif global_position.x > right:
			global_position.x = right
			_direction = -1.0

	if randi() % 100 == 99:
		_shoot()

func _reset_timer() -> void:
	_timer = randf_range(change_dir_min, change_dir_max)

func _shoot() -> void:
	var projectile := proj.instantiate() as Area2D
	projectile.global_position = global_position
	projectile.position.y += 25
	projectile.rotation_degrees = 180
	add_sibling(projectile)
