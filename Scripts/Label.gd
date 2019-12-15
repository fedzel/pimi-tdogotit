extends Label

func _ready():
	pass
	
func _process(delta):
	text = "Wood: " + String(new_script.wood)
