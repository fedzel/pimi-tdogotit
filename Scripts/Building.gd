extends KinematicBody2D
class_name Building

var _maxHitpoints = 100
var hitpoints = 100

onready var _smokeParticle = get_node("SmokeParticle")

enum damagestate {
	nodamage,
	damaged,
	destroyed
}

var _prevState

func _ready():
	hitpoints = _maxHitpoints

func _process(delta):
	var newState = healthState() 
	if newState != _prevState:
		if newState == damagestate.destroyed:
			visible = false
		elif newState == damagestate.damaged:
			_smokeParticle.emitting = true
		else:
			_smokeParticle.emitting = false
		
func healthState():
	if hitpoints <= 0:
		return damagestate.destroyed
	elif hitpoints < _maxHitpoints:
		return damagestate.damaged
	else:
		return damagestate.nodamage

