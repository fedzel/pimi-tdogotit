extends "res://Scripts/Mob.gd"

var _currentTask

func _process(delta):
	if _currentTask == null && TaskList.tasks.count > 0:
		_currentTask = TaskList.tasks[0]
		TaskList.tasks.remove(0)


