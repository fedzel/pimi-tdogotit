extends "res://Scripts/Building.gd"
class_name Storage

func _ready():
	_maxHitpoints = 3000
	BuildingList.storage = self

