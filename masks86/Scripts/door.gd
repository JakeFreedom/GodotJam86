extends Node2D

signal IncorrectKey(doorID)

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

func _ready() -> void:
	if DoorKeyCode == -1:
		locked = false
		static_body_2d.process_mode = Node.PROCESS_MODE_DISABLED
		get_node("Sprite2D").texture = openDoorSprite
		
	area_2d.body_entered.connect(area_2D_body_entered)
		
func KeyCodeEnteredHandler(code: Array) -> void:
	var pulledCode : String
	for num in code:
		pulledCode+=str(num)
		
	if pulledCode == str(DoorKeyCode):
		locked = false
		static_body_2d.process_mode = Node.PROCESS_MODE_DISABLED
		get_node("Sprite2D").texture = openDoorSprite
	
func area_2D_body_entered(otherBody: Node2D) -> void:
	
	#We could check to see if the otherBody is a player and then grab keys to see its the correct one
	if otherBody.is_in_group("Player"):
		#When you walk up to a door we need to check to see if it's unlocked
		if not locked:
			static_body_2d.process_mode = Node.PROCESS_MODE_DISABLED
			get_node("Sprite2D").rotation+=deg_to_rad(180.0)
			print(get_node("Sprite2D").rotation)

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
				for k in otherBody.CheckInventory().GetInventory():
					if k.ItemID == self.DoorKeyCode:
						locked = false
						static_body_2d.process_mode = Node.PROCESS_MODE_DISABLED
						get_node("Sprite2D").texture = openDoorSprite
						get_node("Sprite2D").rotation+=deg_to_rad(180.0)
			IncorrectKey.emit(DoorID)
	pass
