extends Control



func _on_Button_pressed():
	get_node("AudioStreamPlayer").play()
	get_tree().change_scene("res://Scenes/World.tscn")
	


func _on_Button2_pressed():
	get_node("AudioStreamPlayer").play()
	get_tree().change_scene("res://Scenes/Ohje.tscn")


func _on_Button3_pressed():
	get_node("AudioStreamPlayer").play()
	get_tree().quit()
