extends Node2D

var timer_allowed = true
var spawnables = 5

func _ready():
	wavespawns()

func updatewaves():
	wavespawns()

func wavespawns():
	if MobSpawn.waves == 1:
		spawnables = 3
	if MobSpawn.waves == 2:
		spawnables = 5
	if MobSpawn.waves == 3:
		spawnables = 8
	if MobSpawn.waves == 4:
		spawnables = 12
	if MobSpawn.waves == 5:
		spawnables = 16
	if MobSpawn.waves == 6:
		spawnables = 20
	if MobSpawn.waves == 7:
		spawnables = 28
	if MobSpawn.waves == 8:
		spawnables = 38
	if MobSpawn.waves == 9:
		spawnables = 50
	if MobSpawn.waves == 10:
		spawnables = 50

func _on_Timer_timeout():
	if timer_allowed:
		if spawnables > 0:
			randomize()
			var random = randi() % 2 + 1
			if random == 1:
				MobSpawn.sammuttajamob = MobSpawn.Sammuttaja.instance()
				get_tree().call_group("WorldBase", "spawnSammuttaja")
			if random == 2:
				MobSpawn.saboteurmob = MobSpawn.Saboteur.instance()
				get_tree().call_group("WorldBase", "spawnSaboteur")
			spawnables -= 1

