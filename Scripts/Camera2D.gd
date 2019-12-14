extends Camera2D

var mouse_captured = false

var pan_speed = 400

func _unhandled_input(event):
	if event.is_action_pressed("middle_mouse_button"):
		mouse_captured = true
	elif event.is_action_released("middle_mouse_button"):
		mouse_captured = false
	if mouse_captured && event is InputEventMouseMotion:
		position -= event.relative * zoom