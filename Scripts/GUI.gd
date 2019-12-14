extends Control

func _process(delta):
	var m = get_global_mouse_position()
	get_node("GraphicLoader").position = m

func _input(event):
	if event.is_action_pressed("left_click"):
		get_node("ItemList").unselect_all()
		get_node("GraphicLoader").hide()


func _on_ItemList_item_selected(index):
<<<<<<< HEAD
	var task = BuildTask.new()
	var graphic
	if get_node("ItemList").is_anything_selected():
		graphic = get_node("ItemList").get_item_icon(index)
		get_node("GraphicLoader").show()
	
	get_node("GraphicLoader").texture = graphic
	get_global_mouse_position()


func _on_ItemList_item_activated(index):
	print(index, " AKTIVOITU")
=======
	print(index)
>>>>>>> 77fd28214ff2260b31bfd0e4651d66d5ecdb3601
