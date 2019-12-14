extends "res://Scripts/Tasks/Task.gd"
class_name WoodTask

var bonfirePosition: Vector2

var _goingToTree = true
var _workTime = 0
var _maxChopTime = 2
var _maxUnloadTime = 1

func start(mob: Mob):
	mob.target = self.movePosition

func perform(mob: Mob, delta: float):
	if _goingToTree:
		if self.isAtLocation(mob):
			_workTime += delta
			if _workTime > _maxChopTime:
				_workTime = 0
				_goingToTree = false
				mob.target = bonfirePosition
	else:
		if mob.target.distance_to(bonfirePosition) < TASK_DISTANCE:
			_workTime += delta
			if _workTime > _maxUnloadTime:
				_workTime = 0
				_goingToTree = true
				mob.target = self.movePosition
	
func outcome(mob: Mob):
	pass

