extends CharacterBody2D

func _physics_process(delta):
	if randi_range(0, 1000) == 67:
		velocity += Vector2(randf_range(-50, 50), randf_range(-50, 50))
	var previousVelocity = velocity
	if move_and_slide() == true : 
		velocity = -previousVelocity
	pass
