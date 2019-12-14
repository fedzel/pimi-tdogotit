extends "res://Scripts/Building.gd"
class_name Bonfire

func _ready():
	BuildingList.bonfire = self
	pass
	
func _process(delta):
	print(hitpoints)
