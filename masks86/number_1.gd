extends Area2D

func _process(delta: float) -> void:
	pass
	
func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		print(event)
