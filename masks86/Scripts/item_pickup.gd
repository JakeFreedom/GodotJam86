extends Area2D

signal PickUpItem


func _ready() -> void:
	body_entered.connect(OnBodyEntered)

func _process(delta: float) -> void:
	pass
	
func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("MouseClick"):
		if event is InputEventMouseButton:
			if event.button_index == 1:
				PickUpItem.emit()

func _unhandled_input(event: InputEvent) -> void:
	pass
	
func OnBodyEntered(otherBody: Node2D) -> void:
	pass
