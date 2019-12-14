extends KinematicBody2D
class_name Building

var hitpoints = 100

func _process(delta):
	if isDestroyed():
		visible = false
		
func isDestroyed():
	return hitpoints <= 0

