extends "res://Scripts/Tasks/Task.gd"
class_name BuildTask

var scenePath;

func start(mob: Mob):
	mob.target = self.movePosition

func perform(mob: Mob, delta: float):
	if self.isAtLocation(mob):
		outcome(mob)
		finished = true

func outcome(mob: Mob):
	var scene = load(scenePath)
	var building = scene.instance()
	var root = get_tree().get_root().get_node(".")
	root.add_child(building)
	pass
