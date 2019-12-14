extends Node2D

onready var nav = get_node("Navigation2D")
onready var target_loc = get_node("Navigation2D/Target")
onready var location = get_node("Navigation2D/Monster")
onready var NavPolyInstance = get_node("Navigation2D/NavigationPolygonInstance")
onready var Cutout = get_node("Navigation2D/Cutout")


func _process(delta):
	modifyNavPoly()
	var new_path = nav.get_simple_path(location.position, target_loc.position)
	print(new_path, " location")
	location.set_path(new_path)
	prints(location.position, target_loc.position)
	

func adjustPolygonPosition(inTransform, inPolygon):
	var outPolygon = PoolVector2Array()
	var finalTransform = NavPolyInstance.transform.inverse() * inTransform

	for vertex in inPolygon:
		outPolygon.append(finalTransform.xform(vertex))

	return outPolygon

func modifyNavPoly():
	NavPolyInstance.navpoly.add_outline(adjustPolygonPosition(Cutout.transform, Cutout.polygon))
	NavPolyInstance.navpoly.make_polygons_from_outlines()
	var navPolyInstance = get_node("Navigation2D/NavigationPolygonInstance")
	navPolyInstance.enabled = false
	navPolyInstance.enabled = true