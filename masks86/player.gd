extends CharacterBody2D




func _process(delta: float) -> void:
	var vector = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = vector * 100 
	
	
	move_and_slide()
