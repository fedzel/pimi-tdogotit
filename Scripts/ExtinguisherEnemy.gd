extends "res://Scripts/Enemy.gd"

var _hitTimer: float
var _maxHitTimer = 2

func _ready():
	self._speed = 50
	self.setTarget(BuildingList.bonfire.position)
	_hitTimer = _maxHitTimer
	pass
	
func _process(delta):
	if self.position.distance_to(BuildingList.bonfire.position) < Task.TASK_DISTANCE:
		_hitTimer += delta
		if _hitTimer > _maxHitTimer:
			_hitTimer = 0
			BuildingList.bonfire.hitpoints -= 20
