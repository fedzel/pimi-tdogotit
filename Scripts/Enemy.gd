extends "res://Scripts/Mob.gd"

var hitpoints = 3

func _ready():
	EnemyList.enemies.append(self)
	pass


func _on_Area2D_body_entered(body):
	if body.get_meta("type") == "bullet":
		body.queue_free()
		hitpoints -= 1
		if hitpoints <= 0:
			EnemyList.enemies.erase(self)
			queue_free()
	pass # Replace with function body.
