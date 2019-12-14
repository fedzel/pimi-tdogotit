extends Node2D

#onready var nav = get_node("Navigation2D")
#onready var location = $Navigation/Player
#onready var target_loc = $Navigation/Monster
#
#func _unhandled_input(event):
#	var new_path = nav.get_simple_path(target_loc.translation, location.translation)
#	target_loc.path = new_path
#	prints(target_loc.translation, location.translation)