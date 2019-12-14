extends Node2D

#onready var nav = get_node("Navigation2D")
#onready var location = $Navigation/Player
#onready var target_loc = $Navigation/Monster
#
#func _unhandled_input(event):
#	var new_path = nav.get_simple_path(target_loc.translation, location.translation)
#	target_loc.path = new_path
#	prints(target_loc.translation, location.translation)

var _mouseOnGUI = false
var _buildingPath = null

func _input(event):
	if event.is_action_pressed("left_click") && _mouseOnGUI == false && _buildingPath != null:
		var root = get_tree().get_root().get_node(".")
		var mousePos = get_global_mouse_position()
		print("build ", mousePos)
		var consite = load("res://Scenes/ConstructionSite.tscn").instance()
		root.add_child(consite)
		consite.position = mousePos
		var task = BuildTask.new(consite, _buildingPath)
		TaskList.tasks.append(task)
		_buildingPath = null


func MouseOnGUI():
	print("ON")
	_mouseOnGUI = true

func MouseOffGUI():
	print("OFF")
	_mouseOnGUI = false

func buildingSelected(path: String):
	_buildingPath = path
