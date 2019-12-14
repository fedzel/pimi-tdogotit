extends KinematicBody2D
class_name Mob

var target = Vector2(10,5)
var _speed = 10

func _physics_process(delta):
	var pos = target - position
	pos = pos.normalized()
	move_and_slide(pos * _speed)
