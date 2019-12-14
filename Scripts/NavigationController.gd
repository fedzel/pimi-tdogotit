extends Navigation2D


onready var NavPolyInstance = get_node("NavigationPolygonInstance")
#onready var Cutout = get_node("Navigation2D/Cutout")


func _ready():
	modifyNavPoly()
	

func getPath(from: Vector2, to: Vector2):
	return self.get_simple_path(from, to)

func adjustPolygonPosition(inTransform, inPolygon):
	var outPolygon = PoolVector2Array()
	var finalTransform = NavPolyInstance.transform.inverse() * inTransform

	for vertex in inPolygon:
		outPolygon.append(finalTransform.xform(vertex))

	return outPolygon

func modifyNavPoly():
	pass
#	THIS IS NEEDED FOR REMOVING WALKABLE AREAS WHEN IT IS IMPLEMENTED
#	NavPolyInstance.navpoly.add_outline(adjustPolygonPosition(Cutout.transform, Cutout.polygon))
#	NavPolyInstance.navpoly.make_polygons_from_outlines()
#	var navPolyInstance = get_node("Navigation2D/NavigationPolygonInstance")
#	navPolyInstance.enabled = false
#	navPolyInstance.enabled = true