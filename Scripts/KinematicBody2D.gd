extends KinematicBody2D

var target = Vector2(10,5)

func _physics_process(delta):
	var pos = target - position
	pos = pos.normalized()
	var speed = 10
	move_and_slide(pos * speed)
	