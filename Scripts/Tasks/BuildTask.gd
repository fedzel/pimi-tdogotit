extends "res://Scripts/Tasks/Task.gd"
class_name BuildTask

var _scenePath: String
var _constructionSite
var _buildPos: Vector2

func _init(constructionSiteIn, buildId: String):
	_scenePath = buildId
	_constructionSite = constructionSiteIn
	_buildPos = constructionSiteIn.position
	

func start(mob: Mob):
	mob.setTarget(self._buildPos)

func perform(mob: Mob, delta: float):
	if self.isAtLocation(mob, _constructionSite.position):
		_constructionSite.constructionTime += delta
		if _constructionSite.isCompleted():			
			outcome(mob)
			finished = true

func outcome(mob: Mob):
	var scene = load(_scenePath)
	print("DONE ", _scenePath)
	var building = scene.instance()
	building.position = _constructionSite.position
	var root = _constructionSite.get_tree().get_root().get_node("Node2D/Navigation2D/Buildings")
	root.add_child(building)
	_constructionSite.queue_free()
