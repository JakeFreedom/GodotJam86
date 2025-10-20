extends Node2D


var dialogBoxScene = preload("res://dialog.tscn")
var ghostHelperScene = preload("res://ghostHelper.tscn")
var ghostHelper
func _ready() -> void:
	#Room 1 Doors
	get_node("Doors/Room1/Room1-NorthDoor").IncorrectKey.connect(IncorrectKeyHandler)
	get_node("Doors/Room1/Room1-EastDoor").IncorrectKey.connect(IncorrectKeyHandler)
	get_node("Doors/Room1/Room1-WestDoor").IncorrectKey.connect(IncorrectKeyHandler)
	get_node("Doors/Room1/Room1-SouthDoor").IncorrectKey.connect(IncorrectKeyHandler)
	
	get_node("Doors/Room1/Room1-SouthDoor").IncorrectMask.connect(IncorrectMaskHandler)
	
	#Room 1-1
	get_node("Doors/Room1-1/Room1-1-NorthDoor").IncorrectKey.connect(IncorrectKeyHandler)
	get_node("Doors/Room1-1/Room1-1-SouthDoor").IncorrectKey.connect(IncorrectKeyHandler)
	get_node("Doors/Room1-1/Room1-1-WestDoor").IncorrectKey.connect(IncorrectKeyHandler)	
	get_node("Doors/Room1-1/Room1-1-EastDoor").IncorrectKey.connect(IncorrectKeyHandler)
	
	#Room 2
	get_node("Doors/Room 2/Room2-NorthDoor").IncorrectKey.connect(IncorrectKeyHandler)	
	get_node("Doors/Room 2/Room2-SouthDoor")	
	get_node("Doors/Room 2/Room2-WestDoor").IncorrectMask.connect(IncorrectMaskHandler)
	get_node("Doors/Room 2/Room2-EastDoor")
	
	#Room 3
	#get_node("Doors/Room 3/Room3-NorthDoor").IncorrectKey.connect(IncorrectKeyHandler)	
	get_node("Doors/Room 3/Room3-SouthDoor").PermaLock.connect(PermaLockDoor)
	get_node("Doors/Room 3/Room3-WestDoor").IncorrectKey.connect(IncorrectKeyHandler)
	get_node("Doors/Room 3/Room3-EastDoor").IncorrectMask.connect(IncorrectMaskHandler)
	
	#Room 4 Doors
	get_node("Doors/Room 4/Room4-NorthDoor").IncorrectKey.connect(IncorrectKeyHandler)	
	get_node("Doors/Room 4/Room4-SouthDoor").IncorrectKey.connect(IncorrectKeyHandler)	
	get_node("Doors/Room 4/Room4-WestDoor").IncorrectKey.connect(IncorrectKeyHandler)
	get_node("Doors/Room 4/Room4-EastDoor").IncorrectKey.connect(IncorrectKeyHandler)	
	
	get_node("Doors/Room 4/Room4-NorthDoor").IncorrectMask.connect(IncorrectMaskHandler)
	get_node("Doors/Room 4/Room4-SouthDoor").IncorrectMask.connect(IncorrectMaskHandler)
	get_node("Doors/Room 4/Room4-WestDoor").IncorrectMask.connect(IncorrectMaskHandler)
	get_node("Doors/Room 4/Room4-EastDoor").IncorrectMask.connect(IncorrectMaskHandler)
	
	
	#Room 5 Doors
	get_node("Doors/Room 5/Room5-NorthDoor").IncorrectKey.connect(IncorrectKeyHandler)	
	get_node("Doors/Room 5/Room5-SouthDoor").IncorrectKey.connect(IncorrectKeyHandler)	
	get_node("Doors/Room 5/Room5-WestDoor").IncorrectKey.connect(IncorrectKeyHandler)
	get_node("Doors/Room 5/Room5-EastDoor").IncorrectKey.connect(IncorrectKeyHandler)	
	
	get_node("Doors/Room 5/Room5-NorthDoor").IncorrectMask.connect(IncorrectMaskHandler)
	get_node("Doors/Room 5/Room5-SouthDoor").IncorrectMask.connect(IncorrectMaskHandler)
	get_node("Doors/Room 5/Room5-WestDoor").IncorrectMask.connect(IncorrectMaskHandler)
	get_node("Doors/Room 5/Room5-EastDoor").IncorrectMask.connect(IncorrectMaskHandler)
	
	get_node("Doors/Room 5/Room5-NorthDoor").PermaLock.connect(PermaLockDoor)
	get_node("Doors/Room 5/Room5-SouthDoor").PermaLock.connect(PermaLockDoor)
	get_node("Doors/Room 5/Room5-WestDoor").PermaLock.connect(PermaLockDoor)
	
	#Room 6 Doors
	get_node("Doors/Room 6/Room6-NorthDoor").IncorrectKey.connect(IncorrectKeyHandler)	
	get_node("Doors/Room 6/Room6-SouthDoor").IncorrectKey.connect(IncorrectKeyHandler)	
	get_node("Doors/Room 6/Room6-WestDoor").IncorrectKey.connect(IncorrectKeyHandler)
	get_node("Doors/Room 6/Room6-EastDoor").IncorrectKey.connect(IncorrectKeyHandler)	
	
	get_node("Doors/Room 6/Room6-NorthDoor").IncorrectMask.connect(IncorrectMaskHandler)
	get_node("Doors/Room 6/Room6-SouthDoor").IncorrectMask.connect(IncorrectMaskHandler)
	get_node("Doors/Room 6/Room6-WestDoor").IncorrectMask.connect(IncorrectMaskHandler)
	get_node("Doors/Room 6/Room6-EastDoor").IncorrectMask.connect(IncorrectMaskHandler)
	
	get_node("Doors/Room 6/Room6-WestDoor").PermaLock.connect(PermaLockDoor)
	get_node("Doors/Room 6/Room6-NorthDoor").PermaLock.connect(PermaLockDoor)
	
	#Room 7 Doors
	get_node("Doors/Room 7/Room7-NorthDoor").IncorrectKey.connect(IncorrectKeyHandler)	
	get_node("Doors/Room 7/Room7-SouthDoor").IncorrectKey.connect(IncorrectKeyHandler)	
	get_node("Doors/Room 7/Room7-WestDoor").IncorrectKey.connect(IncorrectKeyHandler)
	get_node("Doors/Room 7/Room7-EastDoor").IncorrectKey.connect(IncorrectKeyHandler)	
	
	get_node("Doors/Room 7/Room7-NorthDoor").IncorrectMask.connect(IncorrectMaskHandler)
	get_node("Doors/Room 7/Room7-SouthDoor").IncorrectMask.connect(IncorrectMaskHandler)
	get_node("Doors/Room 7/Room7-WestDoor").IncorrectMask.connect(IncorrectMaskHandler)
	get_node("Doors/Room 7/Room7-EastDoor").IncorrectMask.connect(IncorrectMaskHandler)
	
	get_node("Doors/Room 7/Room7-NorthDoor").PermaLock.connect(PermaLockDoor)
	#get_node("Doors/Room 7/Room7-SouthDoor").PermaLock.connect(PermaLockDoor)
	get_node("Doors/Room 7/Room7-WestDoor").PermaLock.connect(PermaLockDoor)
	get_node("Doors/Room 7/Room7-EastDoor").PermaLock.connect(PermaLockDoor)
	
	#Room 8 Doors
	get_node("Doors/Room 8/Room8-WestDoor").IncorrectKey.connect(IncorrectKeyHandler)
	
	get_node("Doors/Room 8/Room8-NorthDoor").PermaLock.connect(PermaLockDoor)
	get_node("Doors/Room 8/Room8-EastDoor").PermaLock.connect(PermaLockDoor)
	
	#Room 9 Doors
	get_node("Doors/Room 9/Room9-SouthDoor").PermaLock.connect(PermaLockDoor)
	get_node("Doors/Room 9/Room9-EastDoor").PermaLock.connect(PermaLockDoor)
	
	#Room 10 Doors
	get_node("Doors/Room 10/Room10-NorthDoor").PermaLock.connect(PermaLockDoor)
	get_node("Doors/Room 10/Room10-EastDoor").PermaLock.connect(PermaLockDoor)
	
	#Room 11 Doors
	get_node("Doors/Room 11/Room11-SouthDoor").PermaLock.connect(PermaLockDoor)
	get_node("Doors/Room 11/Room11-EastDoor").PermaLock.connect(PermaLockDoor)
	
	#Room 12 Doors
	get_node("Doors/Room 12/Room12-WestDoor").IncorrectKey.connect(IncorrectKeyHandler)
	
	get_node("Doors/Room 12/Room12-SouthDoor").PermaLock.connect(PermaLockDoor)
	get_node("Doors/Room 12/Room12-NorthDoor").PermaLock.connect(PermaLockDoor)
	
	#Room 13 Doors
	get_node("Doors/Room 13/Room13-SouthDoor").PermaLock.connect(PermaLockDoor)
	get_node("Doors/Room 13/Room13-WestDoor").PermaLock.connect(PermaLockDoor)
	get_node("Doors/Room 13/Room13-EastDoor").IncorrectKey.connect(IncorrectKeyHandler)
	#Room 14 Doors
	get_node("Doors/Room 14/Room14-NorthDoor").PermaLock.connect(PermaLockDoor)
	get_node("Doors/Room 14/Room14-WestDoor").PermaLock.connect(PermaLockDoor)
		
	#Room 15 Doors -- Ending Room
	
	
	
	get_tree().create_timer(1).timeout.connect(PlayerGhostHelp)
	#get_node("BackGroundAudio/AudioStreamPlayer2D").play()
	
	var roomLabels = get_tree().get_nodes_in_group("RMLabel")
	for labels in roomLabels:
		labels.visible = false
	
	#Get all th door and disable the doors that are hidden
	var doors = get_tree().get_nodes_in_group("Door")
	for door in doors:
		if not door.visible:
			door.process_mode = Node.PROCESS_MODE_DISABLED
	

func IncorrectKeyHandler(id, message) -> void:
	#print(" you don't have correct key for door " + str(id))
	var defaultMessage = "You don't seem to have the correct key to open that door. Try looking around a bit more."
	
	var player = get_tree().get_first_node_in_group("Player") as Player
	#var message: Label = Label.new()
	#message.text = "Incorrect Key"
	#get_tree().get_first_node_in_group("Player").add_child(message)
	#var dialogBox = dialogBoxScene.instantiate() as Dialog
	if ghostHelper != null:
		ghostHelper.DeleteGhost()

	ghostHelper = ghostHelperScene.instantiate()
	get_tree().get_first_node_in_group("MainCam").add_child(ghostHelper)
	#get_tree().get_first_node_in_group("Player").add_child(dialogBox)
	#add_child(dialogBox)
	if message.length() > 0:
		ghostHelper.dialog.SetMessageText(message, 4.0)
	else:
		ghostHelper.dialog.SetMessageText(defaultMessage, 4.0)
	#get_tree().get_first_node_in_group("MainCam").add_child(dialogBox)
	#dialogBox.global_position = player.global_position
	pass


func IncorrectMaskHandler(id,message)-> void:
	var player = get_tree().get_first_node_in_group("Player")
	var dialogBox = dialogBoxScene.instantiate() as Dialog
	
	
	if ghostHelper != null:
		ghostHelper.DeleteGhost()
	
	ghostHelper = ghostHelperScene.instantiate()
	get_tree().get_first_node_in_group("MainCam").add_child(ghostHelper)
	ghostHelper.dialog.SetMessageText("You don't seem to be wearing the correct mask to to open this door. If you have it, make sure it's selected in your inventory...", 5.0)
	#add_child(dialogBox)
	#dialogBox.SetMessageText("You don't seem to be wearing the correct mask to open this door. If you have it, make sure it's selected in your inventory.",5.0)
	#dialogBox.global_position = player.global_position
	
	
func PermaLockDoor(id, message)-> void:
	var player = get_tree().get_first_node_in_group("Player")
	var dialogBox = dialogBoxScene.instantiate() as Dialog

	if ghostHelper != null:
		ghostHelper.DeleteGhost()
		
	ghostHelper = ghostHelperScene.instantiate()
	get_tree().get_first_node_in_group("MainCam").add_child(ghostHelper)
	ghostHelper.dialog.SetMessageText(message, 2.0)
	
	
func PlayerGhostHelp():
	var ghostHelper = ghostHelperScene.instantiate()
	get_tree().get_first_node_in_group("MainCam").add_child(ghostHelper)
	ghostHelper.dialog.SetMessageText("There are points of interest in rooms that you might want to check out. There seems to be a key to a room down there to your right. That may open a room that is currently locked." , 10.0)
	pass
