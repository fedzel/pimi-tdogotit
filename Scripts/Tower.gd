extends "res://Scripts/Building.gd"
class_name Tower

var _cooldown = 0
var _maxCooldown = 1

func _ready():
	BuildingList.towers.append(self)

func _process(delta):
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
