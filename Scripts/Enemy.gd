extends "res://Scripts/Mob.gd"

var hitpoints = 3

func _ready():
	EnemyList.enemies.append(self)
	pass


func _on_Area2D_body_entered(body):
	if body.get_meta("type") == "bullet":
		body.queue_free()
		hitpoints -= 1
		PlayAudio()
		if hitpoints <= 0:
			PlayDead()
			EnemyList.enemies.erase(self)
			queue_free()
	pass # Replace with function body.
func PlayAudio():
	randomize()
	var random = randi() % 3 + 1
	if random == 1:
		get_node("AudioStreamPlayer2D").pitch_scale = 0.8
		get_node("AudioStreamPlayer2D").stream = load("res://Assets/Äänet/viholline1.wav")
		get_node("AudioStreamPlayer2D").play()
	if random == 2:
		get_node("AudioStreamPlayer2D").pitch_scale = 0.8
		get_node("AudioStreamPlayer2D").stream = load("res://Assets/Äänet/viholline2.wav")
		get_node("AudioStreamPlayer2D").play()
	if random == 3:
		get_node("AudioStreamPlayer2D").pitch_scale = 0.9
		get_node("AudioStreamPlayer2D").stream = load("res://Assets/Äänet/viholline1.wav")
		get_node("AudioStreamPlayer2D").play()

func PlayDead():
	get_node("AudioStreamPlayer2D").pitch_scale = 0.8
	get_node("AudioStreamPlayer2D").stream = load("res://Assets/Äänet/viholline3.wav")
	get_node("AudioStreamPlayer2D").play()