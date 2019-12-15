extends "res://Scripts/Building.gd"

var _cutoutDone = false

onready var cutoutPolygon = $CutoutPolygon

func _ready():
	BuildingList.towers.append(self)
	
func _exit_tree():
	reinsert()

func _process(delta):
	if _cutoutDone == false:
		cutout()
		_cutoutDone = true

var cutoutId;

func cutout():
	#cutoutPolygon.offset = position
	cutoutId = get_parent().get_parent().cutout(cutoutPolygon, position)
	
func reinsert():
	get_parent().get_parent().reinsert(cutoutId)