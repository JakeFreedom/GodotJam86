extends Area2D

@onready var invBoardClick: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"


func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("MouseClick"):
		if event is InputEventMouseButton:
			if event.button_index == 1:
				#call the slot particular slot we are interested in.
				#This will be the click audio
				invBoardClick.play()
				get_parent().IAmTheInventorySlot()
