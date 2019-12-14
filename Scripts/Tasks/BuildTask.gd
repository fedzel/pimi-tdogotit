extends "res://Scripts/Tasks/Task.gd"
class_name BuildTask

var _scenePath: String
var _buildPos: Vector2

func _init(buildPosIn: Vector2, buildId: String):
	_scenePath = buildId
	_buildPos = buildPosIn
	

func start(mob: Mob):
	mob.target = self._buildPos

func perform(mob: Mob, delta: float):
	if self.isAtLocation(mob, _buildPos):
		outcome(mob)
		finished = true

func outcome(mob: Mob):
	var scene = load(_scenePath)
	var building = scene.instance()
	var root = get_tree().get_root().get_node(".")
	root.add_child(building)
	pass
