extends "res://Scripts/Building.gd"
class_name Tower

var _cooldown = 0
const _maxCooldown = 2

var cutoutId;
var _cutoutDone = false

onready var cutoutPolygon = $CutoutPolygon

func _ready():
	BuildingList.towers.append(self)
	BuildingList.walls.append(self)
	
func _exit_tree():
	reinsert()

func _process(delta):
	if _cutoutDone == false:
		cutout()
		_cutoutDone = true


func cutout():
	#cutoutPolygon.offset = position
	cutoutId = get_parent().get_parent().cutout(cutoutPolygon, position)
	
func reinsert():
	get_parent().get_parent().reinsert(cutoutId)
