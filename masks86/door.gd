extends Node2D

signal IncorrectKey(doorID)

@onready var static_body_2d: StaticBody2D = $Sprite2D/StaticBody2D
@onready var h_box_container: HBoxContainer = $"../Control/VBoxContainer/HBoxContainer"

@onready var area_2d: Area2D = $Sprite2D/Area2D

@export var keyPad: PackedScene #This is optional of course
@export var DoorID: int = 0
@export var lockType: Array
@export var displayVisuals: Array #Not sure what this will be at the moment

var locked: bool = true
var keyCodeToUnlock: String #This could be either the player has the corresponding key or we will need an event listener to listen for keypad code
var keyPadScene

func _ready() -> void:
	area_2d.body_entered.connect(area_2D_body_entered)
		
func KeyCodeEnteredHandler() -> void:
	pass
	
func area_2D_body_entered(otherBody: Node2D) -> void:
	#When you walk up to a door we need to check to see if it's unlocked
	if not locked:
		static_body_2d.process_mode = Node.PROCESS_MODE_DISABLED

		
	if keyPad != null:
		keyPadScene = keyPad.instantiate()
		keyPadScene.On_KeyCodeEntered.connect(KeyCodeEnteredHandler)
		h_box_container.add_child(keyPadScene)
		get_tree().paused = true
	#if not we need to check to see if we have the correct key to unlock
	#or if its not a key type door we need to display the key pad from them to enter the code in
	IncorrectKey.emit(DoorID)
	pass
