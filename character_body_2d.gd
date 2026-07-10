extends CharacterBody2D

@export var speed = 200

@export var rotation_speed = 1.5

@onready var player : AnimationPlayer = $AnimationPlayer
signal sorti_de_la_voiture

var rotation_direction = 0

func get_input():
	if sorti == true : 
		rotation_direction = 0
		velocity = Vector2(0,0)
		return
	rotation_direction = Input.get_axis("gauche", "droite")
	velocity = transform.x * Input.get_axis("haut", "bas") * speed
	
	if Input.is_action_just_pressed("espace"):
		player.play("porte1")
	
func _physics_process(delta):
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://store.tscn")
	
var sorti = false 
	
@onready var perso0 = preload("res://perso.tscn")
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "porte1":
		if sorti == false :
			var monPerso = perso0.instantiate()
			monPerso.position = self.position + Vector2(5,0)
			get_parent().add_child(monPerso)
			monPerso.switchCamera()
			sorti = true
			sorti_de_la_voiture.emit()
	
