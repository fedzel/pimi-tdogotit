extends Navigation2D


onready var NavPolyInstance = get_node("NavigationPolygonInstance")
#onready var Cutout = get_node("Navigation2D/Cutout")
	

func getPath(from: Vector2, to: Vector2):
	return self.get_simple_path(from, to)

func adjustPolygonPosition(inTransform, inPolygon, offset):
	var outPolygon = PoolVector2Array()
	var finalTransform = NavPolyInstance.transform.inverse() * inTransform

	for vertex in inPolygon:
		var finalVertex = finalTransform.xform(vertex)
		finalVertex.x += offset.x
		finalVertex.y += offset.y
		outPolygon.append(finalVertex)

	return outPolygon
	
func reinsert(poly, offset):
	pass

func cutout(poly, offset):
	NavPolyInstance.navpoly.add_outline(adjustPolygonPosition(poly.transform, poly.polygon, offset))
	NavPolyInstance.navpoly.make_polygons_from_outlines()
	var navPolyInstance = get_node("NavigationPolygonInstance")
	navPolyInstance.enabled = false
	navPolyInstance.enabled = true
	recalculatePaths()
	
func recalculatePaths():
	for mob in EnemyList.allMobs:
		mob.recalculatePath()
