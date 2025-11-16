extends Sprite2D

var posx: int = 0
var posy: int = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	self.position.x -= 1
	posx -= 1
	if posx <= -1152:
		self.position.x = 0
		posx = 0
	self.position.y -= 1
	posy -= 1
	if posy <= -648:
		self.position.y = 0
		posy = 0
