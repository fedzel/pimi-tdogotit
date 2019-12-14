extends Control

#func _input(event):
#	if event.is_action_pressed("left_click"):
#		var poolint = get_node("ItemList").get_selected_items()
#		for i in poolint:
#			print(i)


func _on_ItemList_item_selected(index):
	var task = BuildTask.new()
	print(index)
