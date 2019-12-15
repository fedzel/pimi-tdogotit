extends "res://Scripts/Building.gd"
class_name Bonfire

const VICTORY_CONDITION = 500

const MAX_TASKS = 3
var tasks = []

onready var sprite = $Sprite

func _ready():
	BuildingList.bonfire = self
	_maxHitpoints = 5000
	hitpoints = 100
	pass

func _process(delta):
	var scaleMultiplier = (hitpoints / 500.0) + 0.3
	var scale = 0.3 * scaleMultiplier
	sprite.scale = Vector2(scale, scale)
	

func _on_Bonfire_input_event(viewport, event, shape_idx):
	pass


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		var mouseEvent = event as InputEventMouseButton
		if mouseEvent.is_pressed() && mouseEvent.button_index == BUTTON_LEFT && tasks.size() < MAX_TASKS:
			var task = BonfireTask.new(BuildingList.storage, self)
			TaskList.tasks.append(task)
			tasks.append(task)
			print("Task Created")
		elif mouseEvent.is_pressed() && mouseEvent.button_index == BUTTON_RIGHT && tasks.size() > 0:
			var task = tasks[tasks.size()-1]
			task.cancel()
			tasks.erase(task)
