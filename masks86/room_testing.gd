extends Node2D



func _ready() -> void:
	get_node("Door_2").IncorrectKey.connect(IncorrectKeyHandler)
	get_node("Door_3").IncorrectKey.connect(IncorrectKeyHandler)
	get_node("Door_4").IncorrectKey.connect(IncorrectKeyHandler)
	get_node("Door_5").IncorrectKey.connect(IncorrectKeyHandler)
	
	
func IncorrectKeyHandler(id) -> void:
	print(" you don't have correct key for door " + str(id))
	pass
