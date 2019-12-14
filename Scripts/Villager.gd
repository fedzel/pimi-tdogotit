extends "res://Scripts/Mob.gd"
class_name Villager

var _currentTask: Task

func _ready():
	self._speed = 45
	TaskList.all_villagers.append(self)

func _process(delta):
	if _currentTask == null:
		searchForTasks()
	elif _currentTask != null:
		handleTask(delta)

func handleTask(delta):
	_currentTask.perform(self, delta)
	if _currentTask.finished:
		_currentTask = null
		self.setTarget(self.position)
			
func searchForTasks():
	if TaskList.tasks.size() > 0:
		print("Found Task")
		_currentTask = TaskList.tasks[0]
		TaskList.tasks.remove(0)
		_currentTask.start(self)

