extends CharacterBody2D

@export var speed = 175

@export var acceleration = 0.2

@onready var sprite : AnimatedSprite2D = $CollisionShape2D/AnimatedSprite2D

var direction = Input.get_vector("gauche", "droite", "haut", "bas")


func get_input():
	var input_direction = Input.get_vector("gauche", "droite", "haut", "bas")
	velocity = input_direction * speed
	if velocity.x > 0:
		sprite.play("walkd")
	elif velocity.x < 0: 
		sprite.play("walkg")
		
	if velocity.y > 0:
		sprite.play("walkb")
	elif velocity.y < 0:
		sprite.play("walkh")
	
	if velocity.is_zero_approx(): 
		sprite.play("normal")
	

func _physics_process(delta):
	get_input()
	move_and_slide()

func switchCamera():
	$Camera2D2.make_current()
