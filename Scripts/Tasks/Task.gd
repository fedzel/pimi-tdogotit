extends Node
class_name Task

const TASK_DISTANCE = 50

var finished = false

func start(mob: Mob):
	print("Calling virtual superclass Task:start")
	pass

func perform(mob: Mob, delta: float):
	print("Calling virtual superclass Task:perform")
	pass

func isAtLocation(mob: Mob, pos: Vector2):
	return mob.position.distance_to(pos) < TASK_DISTANCE

func outcome(mob: Mob):
	pass
