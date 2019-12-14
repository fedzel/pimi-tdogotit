extends "res://Scripts/Enemy.gd"

var _hitTimer: float
var _maxHitTimer = 2

func _ready():
	self._speed = 100
	if (BuildingList.towers.size() > 0):
		self.target = BuildingList.towers[randi()%BuildingList.towers.size()].position
		print(self.target)
	_hitTimer = _maxHitTimer
	pass
	
func _process(delta):
	if self.position.distance_to(self.target) < Task.TASK_DISTANCE:
		_hitTimer += delta
		if _hitTimer > _maxHitTimer:
			_hitTimer = 0
			