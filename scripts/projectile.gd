extends Area2D

var created: float
var timeout_seconds: float = 6.0
var speed: float = 1200.0

func _ready() -> void:
	created = Time.get_unix_time_from_system()
	
func _process(delta: float) -> void:
	if created + timeout_seconds < Time.get_unix_time_from_system():
		queue_free()
		return
		
	var direction: Vector2 = Vector2.UP.rotated(rotation)
	position += direction * speed * delta
	z_index = 4096
