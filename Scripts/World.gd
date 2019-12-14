extends Node2D
export (PackedScene) var SammuttajaMob
export (PackedScene) var SaboteurMob
export (PackedScene) var SotilasMob

var _mouseOnGUI = false
var _buildingPath = null


func _ready():
	MobSpawn.Sammuttaja = SammuttajaMob

func _input(event):
	if event.is_action_pressed("left_click") && _mouseOnGUI == false && _buildingPath != null:
		var parent = get_node("Navigation2D/Buildings")
		var mousePos = get_global_mouse_position()
		var consite = load("res://Scenes/ConstructionSite.tscn").instance()
		parent.add_child(consite)
		consite.position = mousePos
		var task = BuildTask.new(consite, _buildingPath)
		TaskList.tasks.append(task)
		_buildingPath = null


func MouseOnGUI():
	_mouseOnGUI = true

func MouseOffGUI():
	_mouseOnGUI = false

func buildingSelected(path: String):
	_buildingPath = path

func spawnSammuttaja():
	get_node("Navigation2D/Enemies").add_child(MobSpawn.sammuttajamob)
