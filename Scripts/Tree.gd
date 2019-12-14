extends Area2D
class_name Woods

const MAX_TASKS = 3

var _cutoutDone = false
onready var _cutoutPolygon = $Polygon2D

var woodStored = 500

var tasks = []

func _ready():
	pass

func _process(delta):
	if _cutoutDone == false:
		_cutoutDone = true
		get_parent().get_parent().cutout(_cutoutPolygon, position)
	if woodStored <= 0:
		get_parent().get_parent().reinsert(_cutoutPolygon, position)
		for task in tasks:
			task.cancel()
		queue_free()


func _on_Woods_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		var mouseEvent = event as InputEventMouseButton
		if mouseEvent.is_pressed() && mouseEvent.button_index == BUTTON_LEFT && tasks.size() < MAX_TASKS:
			var task = WoodTask.new(BuildingList.storage, self)
			TaskList.tasks.append(task)
			tasks.append(task)
			print("Task Created")
		elif mouseEvent.is_pressed() && mouseEvent.button_index == BUTTON_RIGHT:
			var task = tasks[tasks.size()-1]
			task.cancel()
			tasks.erase(task)
