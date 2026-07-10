extends Node2D

@onready var musique_rgj : AudioStream = preload("res://musique_rgj.mp3")

@onready var pnjscene = preload("res://pnjj.tscn")

func _on_player_car_sorti_de_la_voiture() -> void:
	$AudioStreamPlayer.set_stream(musique_rgj)
	$AudioStreamPlayer.play()

func _ready() -> void:
	for i in 67:
		var pnj : Node2D = pnjscene.instantiate()
		pnj.position = Vector2(randf_range(-1500, 3500), randf_range(-3000, 500))
		self.add_child(pnj)
