extends Node
class_name Task

const TASK_DISTANCE = 5

var movePosition: Vector2
var finished = false

func start(mob: Mob):
	pass

func perform(mob: Mob, delta: float):
	pass

func isAtLocation(mob: Mob):
	return mob.position.distance_to(movePosition) < TASK_DISTANCE

func outcome(mob: Mob):
	pass
