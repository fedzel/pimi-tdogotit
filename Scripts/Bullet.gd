extends KinematicBody2D

var target = Vector2(10,5)
var _speed = 10

var _lifetime = 0
const MAX_LIFETIME = 1.5

func _ready():
	set_meta("type", "bullet")
	self._speed = 80
	
func _process(delta):
	_lifetime += delta
	if _lifetime > MAX_LIFETIME:
		queue_free()

func _physics_process(delta):
	var pos = target - position
	pos = pos.normalized()
	move_and_slide(pos * _speed)
