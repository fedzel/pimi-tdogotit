extends "res://Scripts/Tasks/Task.gd"
class_name WoodTask

var storage: Storage
var woods

const WOOD_CAPACITY = 50

var _goingToTree = true
var _workTime = 0
var _maxChopTime = 2
var _maxUnloadTime = 1
var _finishAfterDelivery = false

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
				woods.woodStored -= WOOD_CAPACITY
	else:
		if self.isAtLocation(mob, self.storage.position):
			_workTime += delta
			if _workTime > _maxUnloadTime:
				_workTime = 0
				_goingToTree = true
				new_script.wood += WOOD_CAPACITY
				if _finishAfterDelivery:
					finished = true
				else:
					mob.setTarget(self.woods.position)
				

func cancel():
	if _goingToTree:
		finished = true
	else:
		_finishAfterDelivery = true
	

func outcome(mob: Mob):
	pass

