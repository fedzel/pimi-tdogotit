extends KinematicBody2D

var target = Vector2(10,5)
var _speed = 100

var _lifetime = 0
const MAX_LIFETIME = 1.5

func _ready():
	set_meta("type", "bullet")
	self._speed = 80
	randomize()
	var random = randi() % 3 + 1
	if random == 1:
		get_node("AudioStreamPlayer2D").stream = load("res://Assets/Äänet/nuoli1.wav")
		get_node("AudioStreamPlayer2D").play()
	if random == 2:
		get_node("AudioStreamPlayer2D").stream = load("res://Assets/Äänet/nuoli2.wav")
		get_node("AudioStreamPlayer2D").play()
	if random == 3:
		get_node("AudioStreamPlayer2D").stream = load("res://Assets/Äänet/nuoli3.wav")
		get_node("AudioStreamPlayer2D").play()

	
func _process(delta):
	look_at(target)
	_lifetime += delta
	if _lifetime > MAX_LIFETIME:
		queue_free()

func _physics_process(delta):
	var pos = target - position
	pos = pos.normalized()
	move_and_slide(pos * _speed)


