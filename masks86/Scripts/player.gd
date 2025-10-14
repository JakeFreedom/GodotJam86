extends CharacterBody2D



var lastVelocity: Vector2

func _process(delta: float) -> void:
	var vector = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = vector * 800 
	
	if vector != Vector2.ZERO:
		lastVelocity = vector
		
	move_and_slide()
