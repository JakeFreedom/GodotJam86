extends Node2D



func _ready() -> void:
	get_node("Doors/Room1/Room1-NorthDoor").IncorrectKey.connect(IncorrectKeyHandler)
	get_node("Doors/Room1/Room1-EastDoor").IncorrectKey.connect(IncorrectKeyHandler)
	get_node("Doors/Room1/Room1-WestDoor").IncorrectKey.connect(IncorrectKeyHandler)
	get_node("Doors/Room1/Room1-SouthDoor").IncorrectKey.connect(IncorrectKeyHandler)
		
	
func IncorrectKeyHandler(id) -> void:
	print(" you don't have correct key for door " + str(id))
	pass
