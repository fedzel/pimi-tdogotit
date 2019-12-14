extends Node2D

export (PackedScene) var SammuttajaMob

func _ready():
	MobSpawn.Sammuttaja = SammuttajaMob

func spawnSammuttaja():
	get_node("Navigation2D/Enemies").add_child(MobSpawn.sammuttajamob)