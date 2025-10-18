extends Node2D


var dialogBoxScene = preload("res://dialog.tscn")
var ghostHelperScene = preload("res://ghostHelper.tscn")

func _ready() -> void:
	get_node("Doors/Room1/Room1-NorthDoor").IncorrectKey.connect(IncorrectKeyHandler)
	get_node("Doors/Room1/Room1-EastDoor").IncorrectKey.connect(IncorrectKeyHandler)
	get_node("Doors/Room1/Room1-WestDoor").IncorrectKey.connect(IncorrectKeyHandler)
	get_node("Doors/Room1/Room1-SouthDoor").IncorrectKey.connect(IncorrectKeyHandler)
	get_node("Doors/Room1/Room1-SouthDoor").IncorrectMask.connect(IncorrectMaskHandler)
		

func IncorrectKeyHandler(id) -> void:
	print(" you don't have correct key for door " + str(id))
	var player = get_tree().get_first_node_in_group("Player")
	#var message: Label = Label.new()
	#message.text = "Incorrect Key"
	#get_tree().get_first_node_in_group("Player").add_child(message)
	var dialogBox = dialogBoxScene.instantiate() as Dialog
	#get_tree().get_first_node_in_group("Player").add_child(dialogBox)
	add_child(dialogBox)
	dialogBox.SetMessageText("You don't seem to have the correct key to open that door. Trying looking around a bit more.", 4.0)
	dialogBox.global_position = player.global_position
	pass


func IncorrectMaskHandler(id)-> void:
	var player = get_tree().get_first_node_in_group("Player")
	var dialogBox = dialogBoxScene.instantiate() as Dialog
	
	var ghostHelper = ghostHelperScene.instantiate()
	get_tree().get_first_node_in_group("MainCam").add_child(ghostHelper)
	ghostHelper.dialog.SetMessageText("You don't seem to be wearing the correct mask to to open this door. If you have it, make sure it's selected in your inventory...", 6.0)
	#add_child(dialogBox)
	#dialogBox.SetMessageText("You don't seem to be wearing the correct mask to open this door. If you have it, make sure it's selected in your inventory.",5.0)
	#dialogBox.global_position = player.global_position
	
