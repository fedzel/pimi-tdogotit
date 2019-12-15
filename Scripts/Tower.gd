extends "res://Scripts/Building.gd"
class_name Tower

var _cooldown = 0
const _maxCooldown = 2

var _cutoutDone = false

onready var cutoutPolygon = $CutoutPolygon

func _ready():
	BuildingList.towers.append(self)
	
func _exit_tree():
	reinsert()

func _process(delta):
	if _cutoutDone == false:
		cutout()
		_cutoutDone = true
	
	for enemy in EnemyList.enemies:
		if enemy.position.distance_to(position) < 100:
			_cooldown += delta
			if _cooldown > _maxCooldown:
				var root = get_tree().get_root().get_node(".")
				var bulletscene = load("res://Scenes/Bullet.tscn")
				var bullet = bulletscene.instance()
				root.add_child(bullet)
				bullet.position = self.position
				bullet.target = enemy.position
				_cooldown = 0
			continue

var cutoutId;

func cutout():
	#cutoutPolygon.offset = position
	cutoutId = get_parent().get_parent().cutout(cutoutPolygon, position)
	
func reinsert():
	get_parent().get_parent().reinsert(cutoutId)
