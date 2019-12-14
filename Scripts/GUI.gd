extends Control

const TOWER_PATH = "res://Scenes/Tower.tscn"
const WALL_PATH = "" 
const SMITH_PATH = ""
const CASTLE_PATH = ""


func _process(delta):
	var m = get_local_mouse_position()
	get_node("GraphicLoader").position = m

func _input(event):
	if event.is_action_pressed("left_click"):
		get_node("ItemList").unselect_all()
		get_node("GraphicLoader").hide()


func _on_ItemList_item_selected(index):
	var graphic
	if get_node("ItemList").is_anything_selected():
		graphic = get_node("ItemList").get_item_icon(index)
		get_node("GraphicLoader").show()
	
	get_node("GraphicLoader").texture = graphic
	get_global_mouse_position()
	get_tree().call_group("WorldBase", "buildingSelected", buildingPathFromIndex(index))


func buildingPathFromIndex(index: int):
	if index == 0:
		return TOWER_PATH
	elif index == 1:
		return WALL_PATH
	elif index == 2:
		return SMITH_PATH
	elif index == 3:
		return CASTLE_PATH

func _on_ItemList_item_activated(index):
	print(index, " AKTIVOITU")

func _on_ItemList_mouse_entered():
	get_tree().call_group("WorldBase", "MouseOnGUI")

func _on_ItemList_mouse_exited():
	get_tree().call_group("WorldBase", "MouseOffGUI")
