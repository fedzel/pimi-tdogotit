extends Navigation2D


onready var NavPolyInstance = get_node("NavigationPolygonInstance")
#onready var Cutout = get_node("Navigation2D/Cutout")
var runningId = 0

var outlineDict = {}

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
	
func clearNavPoly():
	var first = NavPolyInstance.navpoly.get_outline(0)
	
	NavPolyInstance.navpoly.clear_outlines()
	NavPolyInstance.navpoly.add_outline(first)
	

func reinsert(outlineId):
	outlineDict.erase(outlineId)
	clearNavPoly()
	
	for key in outlineDict.keys():
		var outline = outlineDict[key]
		NavPolyInstance.navpoly.add_outline(outline)
	
	NavPolyInstance.navpoly.make_polygons_from_outlines()
	var navPolyInstance = get_node("NavigationPolygonInstance")
	navPolyInstance.enabled = false
	navPolyInstance.enabled = true
	recalculatePaths()

func cutout(poly, offset):
	var outline = adjustPolygonPosition(poly.transform, poly.polygon, offset)
	runningId += 1
	outlineDict[runningId] = outline
	NavPolyInstance.navpoly.add_outline(outline)
	NavPolyInstance.navpoly.make_polygons_from_outlines()
	var navPolyInstance = get_node("NavigationPolygonInstance")
	navPolyInstance.enabled = false
	navPolyInstance.enabled = true
	recalculatePaths()
	return runningId
	
func recalculatePaths():
	for mob in EnemyList.allMobs:
		mob.recalculatePath()
