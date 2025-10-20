extends Node2D

@onready var button: Button = $Button

func _ready()-> void:
	button.pressed.connect(CloseGame)
	
	
func CloseGame()-> void:
	get_tree().quit()
