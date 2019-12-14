extends Area2D
class_name Woods

func _ready():
	pass


func _on_Woods_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		var mouseEvent = event as InputEventMouseButton
		if mouseEvent.is_pressed() && mouseEvent.button_index == BUTTON_LEFT:
			var task = WoodTask.new(BuildingList.bonfire, self)
			TaskList.tasks.append(task)
			print("Task Created")
				
			
