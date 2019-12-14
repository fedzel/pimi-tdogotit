extends Node2D

export (PackedScene) var SammuttajaMob
export (PackedScene) var SaboteurMob
export (PackedScene) var SotilasMob

func _ready():
	MobSpawn.Sammuttaja = SammuttajaMob


func spawnSammuttaja():
	get_node("Navigation2D/Enemies").add_child(MobSpawn.sammuttajamob)
