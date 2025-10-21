class_name Door
extends Node2D

#Notes about door key codes.
#A keycode of -1 is an open and unlocked door
#A Lock Type of 1 requires a key to open the door -- Lock Type 2 will require a mask to open the door.
#If a door has a keypad scene that will be use the key code for keypad code -- Lock type is 0

signal IncorrectKey(doorID, message)
signal IncorrectMask(doorID, message)
signal PermaLock(doorID, message)

@onready var static_body_2d: StaticBody2D = $Sprite2D/StaticBody2D
#@onready var h_box_container: HBoxContainer = $"../Camera2D/Control/VBoxContainer/HBoxContainer"  #This needs to be diffrent. The camera should not be in charge of where things spawn But works for now
@onready var h_box_container: HBoxContainer = $"../../../Camera2D/Control/VBoxContainer/HBoxContainer"

@onready var area_2d: Area2D = $Area2D

@export var keyPad: PackedScene #This is optional of course
@export var DoorID: int = 0
@export var lockType: int
@export var displayVisuals: Array #Not sure what this will be at the moment
@export var DoorKeyCode: int = 0
@export var openDoorSprite: Texture2D

var locked: bool = true
var keyCodeToUnlock: String #This could be either the player has the corresponding key or we will need an event listener to listen for keypad code
var keyPadScene
@onready var doorOpening: AudioStreamPlayer2D = $DoorOpeningPlayer
@onready var incorrect_code_player: AudioStreamPlayer2D = $IncorrectCodePlayer

func _ready() -> void:
	if DoorKeyCode == -1:
		ChangeToUnlockMode()
		
	area_2d.body_entered.connect(area_2D_body_entered)
		
func KeyCodeEnteredHandler(code: Array) -> void:
	var pulledCode : String
	for num in code:
		pulledCode+=str(num)
		
	if pulledCode == str(DoorKeyCode):
		ChangeToUnlockMode()
		get_node("Sprite2D").rotation+=deg_to_rad(180.0)
		keyPadScene.TheDoorHasOpened()
		#doorOpening.play()
	else:
		incorrect_code_player.play()
		#play incorrect sound
		
		pass
func area_2D_body_entered(otherBody: Node2D) -> void:
	
	#We could check to see if the otherBody is a player and then grab keys to see its the correct one
	if otherBody.is_in_group("Player"):
		#When you walk up to a door we need to check to see if it's unlocked
		if not locked:
			DisableBarrier()
			get_node("Sprite2D").rotation+=deg_to_rad(180.0)
			#print(get_node("Sprite2D").rotation)

		else:	
			if keyPad != null:
				keyPadScene = keyPad.instantiate()
				keyPadScene.On_KeyCodeEntered.connect(KeyCodeEnteredHandler)
				h_box_container.call_deferred("add_child", keyPadScene)
				get_tree().paused = true
			#if not we need to check to see if we have the correct key to unlock
			#or if its not a key type door we need to display the key pad from them to enter the code in
			
			#We don't have a keypad attached to this door at this point in time in development it must be a key.
			#Now we need to look in the person inventory to see if they have the correct key.
			#Right now we will not ID keys to certian rooms.. you find a key, you can use it. But they are 1 time use(we as developers need to keep that in mind as well for level design)
			if lockType == 1: #Don't do this, this is bad
				#this is a lock that requires a key
				var p = otherBody as Player
				if otherBody.CheckInventory().GetInventory().size() == 0:
					IncorrectKey.emit(DoorID,"")
				else:
					var invItems = otherBody.CheckInventory().GetInventory()
					var keyFound: bool = false
					for k in invItems:
						if k.ItemID == self.DoorKeyCode:
							keyFound = true
							#We have the item is it selected
							if k.isSelected:
								ChangeToUnlockMode()
								get_node("Sprite2D").rotation+=deg_to_rad(180.0)
								var invBar = get_tree().get_first_node_in_group("InventoryBar") as InventoryBar
								invBar.RemoveItemFromBar(k)
							else:
								IncorrectKey.emit(DoorID, "You seem to have the correct key, but it doesn't seem to be selected.")
								break
					if not keyFound:
						IncorrectKey.emit(DoorID, "")
			elif lockType == -2:
				PermaLock.emit(DoorID, "This door is permenently locked...")
			else:
				IncorrectMask.emit(DoorID,"")

func PrintDoorCode() -> void:
	pass



func DisableBarrier() -> void:
	static_body_2d.process_mode = Node.PROCESS_MODE_DISABLED

func ChangeToUnlockMode() -> void:
	locked = false;
	DisableBarrier()
	get_node("Sprite2D").texture = openDoorSprite
	doorOpening.play()

func UnlockDoor() -> void:
	ChangeToUnlockMode()
	
