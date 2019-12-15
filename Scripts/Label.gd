extends Label

func _ready():
	pass
	
func _process(delta):
	text = "Puuta: " + String(new_script.wood)
