extends "res://Scripts/Tasks/Task.gd"
class_name BonfireTask

var storage: Storage
var bonfire

const WOOD_CAPACITY = 25

var _goingToStorage = true
var _workTime = 0
const _maxPickupTime = 2
const _maxUnloadTime = 1
var _finishAfterDelivery = false

func _init(storageIn, bonfireIn):
	self.storage = storageIn
	self.bonfire = bonfireIn

func start(mob: Mob):
	mob.setTarget(self.storage.position)

func perform(mob: Mob, delta: float):
	if _goingToStorage:
		if self.isAtLocation(mob, storage.position):
			print("at storage")
			_workTime += delta
			if _workTime > _maxPickupTime:
				_workTime = 0
				_goingToStorage = false
				mob.setTarget(bonfire.position)
				print("target = bonfire")
				new_script.wood -= WOOD_CAPACITY
	else:
		if self.isAtLocation(mob, self.bonfire.position):
			print("at bonfire")
			_workTime += delta
			if _workTime > _maxUnloadTime:
				print("unloaded")
				_workTime = 0
				_goingToStorage = true
				bonfire.hitpoints += WOOD_CAPACITY
				if _finishAfterDelivery:
					finished = true
				else:
					print("target = storage")
					mob.setTarget(self.storage.position)
				

func cancel():
	if _goingToStorage:
		finished = true
	else:
		_finishAfterDelivery = true
	

func outcome(mob: Mob):
	pass

