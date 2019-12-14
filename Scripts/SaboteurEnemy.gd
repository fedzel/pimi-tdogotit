extends "res://Scripts/Enemy.gd"
class_name SaboteurEnemy

var _hitTimer: float
var _maxHitTimer = 2

var _targetBuilding

func _ready():
	self._speed = 50
	if (BuildingList.towers.size() > 0):
		_targetBuilding = BuildingList.towers[randi()%BuildingList.towers.size()]
		self.setTarget(_targetBuilding.position)
	_hitTimer = _maxHitTimer
	pass
	
func _process(delta):
	if _targetBuilding != null && self.position.distance_to(_targetBuilding.position) < Task.TASK_DISTANCE*10:
		_hitTimer += delta
		if _hitTimer > _maxHitTimer:
			_targetBuilding.hitpoints -= 5;
			print("HIT")
			_hitTimer = 0
			