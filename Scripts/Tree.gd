extends Area2D
class_name Woods

var _cutoutDone = false
onready var _cutoutPolygon = $Polygon2D

func _ready():
	pass

func _process(delta):
	if _cutoutDone == false:
		_cutoutDone = true
		get_parent().get_parent().cutout(_cutoutPolygon, position)


func _on_Woods_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		var mouseEvent = event as InputEventMouseButton
		if mouseEvent.is_pressed() && mouseEvent.button_index == BUTTON_LEFT:
			var task = WoodTask.new(BuildingList.storage, self)
			TaskList.tasks.append(task)
			print("Task Created")
				
			
