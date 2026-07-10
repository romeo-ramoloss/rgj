extends Control
@onready var ville = preload("res://s.tscn")

func _on_start_pressed() -> void:
	get_tree().change_scene_to_packed(ville)


func _on_quit_button_down() -> void:
	get_tree().quit()
