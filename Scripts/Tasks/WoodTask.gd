extends "res://Scripts/Tasks/Task.gd"
class_name WoodTask

var storage: Storage
var woods

var _goingToTree = true
var _workTime = 0
var _maxChopTime = 2
var _maxUnloadTime = 1

func _init(storageIn, woodsIn):
	self.storage = storageIn
	self.woods = woodsIn

func start(mob: Mob):
	mob.setTarget(self.woods.position)

func perform(mob: Mob, delta: float):
	if _goingToTree:
		if self.isAtLocation(mob, woods.position):
			_workTime += delta
			if _workTime > _maxChopTime:
				_workTime = 0
				_goingToTree = false
				mob.setTarget(storage.position)
	else:
		if self.isAtLocation(mob, self.storage.position):
			_workTime += delta
			if _workTime > _maxUnloadTime:
				_workTime = 0
				_goingToTree = true
				mob.setTarget(self.woods.position)
	
func outcome(mob: Mob):
	pass

