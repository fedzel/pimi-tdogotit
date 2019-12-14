extends "res://Scripts/Enemy.gd"
class_name SaboteurEnemy

var _hitTimer: float
var _maxHitTimer = 2

var _target: Vector2

func _ready():
	self._speed = 50
	if (BuildingList.towers.size() > 0):
		var target = BuildingList.towers[randi()%BuildingList.towers.size()].position
		self.setTarget(target)
		_target = target
	_hitTimer = _maxHitTimer
	pass
	
func _process(delta):
	if self.position.distance_to(_target) < Task.TASK_DISTANCE:
		_hitTimer += delta
		if _hitTimer > _maxHitTimer:
			_hitTimer = 0
			