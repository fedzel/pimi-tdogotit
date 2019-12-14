extends "res://Scripts/Building.gd"
class_name ConstructionSite

var constructionTime = 0.0
const MAX_CONSTRUCTION_TIME = 10

func isCompleted():
	return constructionTime >= MAX_CONSTRUCTION_TIME
