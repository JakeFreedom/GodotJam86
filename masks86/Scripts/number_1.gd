extends Area2D

@export var number: int
@onready var door_key_pad: Panel = $"../.."

func _process(delta: float) -> void:
	pass
	
func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("MouseClick"):
		if event is InputEventMouseButton:
			if event.button_index == 1:
				#user has left clicked
				door_key_pad.PrintNumber(number)
