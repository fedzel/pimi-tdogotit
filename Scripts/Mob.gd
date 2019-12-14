extends KinematicBody2D
class_name Mob

var target = Vector2(0,500)
var _speed = 10

func _physics_process(delta):
	var pos = target - position
	pos = pos.normalized()
	move_and_slide(pos * _speed)
	
	
#var speed := 2.0
#var path := PoolVector2Array() setget set_path
#
#func ready() -> void:
#	set_process(false)
#
#func _process(delta : float) -> void:
#	var move_distance := speed * delta
#	move_along_path(move_distance)
#	pass
#
#func move_along_path(distance : float) -> void:
#	var start_point := position
#	for i in range(path.size()):
#		var distance_to_next  := start_point.distance_to(path[0])
#		if distance <= distance_to_next and distance >= 0.0 and distance_to_next != 0.0:
#			position = start_point.linear_interpolate(path[0], distance / distance_to_next)
#			break
#		elif distance < 0.0:
#			position = path[0]
#			set_process(false)
#			break
#		distance -= distance_to_next
#		start_point = path[0]
#		path.remove(0)
#	pass
#
#func set_path(value : PoolVector2Array) -> void:
#	if value.size() == 0:
#		return
#
#	path = value
#	set_process(true)
#	pass
#
