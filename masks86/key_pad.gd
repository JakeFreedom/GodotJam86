extends Panel


signal On_KeyCodeEntered
@onready var close_button: Button = $CloseButton
@onready var number_1: Area2D = $Number1

func _ready()-> void:
	close_button.pressed.connect(OnClosePressed)




func OnClosePressed() -> void:
	print("close window")
	get_tree().paused = false
	queue_free()
