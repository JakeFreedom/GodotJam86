class_name Player
extends CharacterBody2D

@export var InventoryUI: PackedScene
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var player: Sprite2D = $Sprite2D

var lastVelocity: Vector2
var ourInventory
var maskID : int = 0

func _ready() -> void:
	ourInventory = get_node("Inventory") as Inventory

func _process(delta: float) -> void:
	
	#This will not allow the player to move diagonally
	var vector: Vector2 = Vector2.ZERO #= Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if Input.is_action_pressed("move_left"):
		vector = Vector2(-1,0)
		player.flip_h = true
		animation_player.play("Walk")
	elif Input.is_action_pressed("move_right"):
		vector = Vector2(1,0)
		player.flip_h = false
		animation_player.play("Walk")
	else:
		if Input.is_action_pressed("move_up"):
			vector = Vector2(0,-1)
			animation_player.play("Walk")
		elif Input.is_action_pressed("move_down"):
			vector = Vector2(0,1)	
			animation_player.play("Walk")
		else:
			animation_player.stop()	
	
	velocity = vector * 250 #This speed will need to be adjusted. Just have it high now for testing purposes
	
	#We are keeping track of this for the camera slide, so we know which direction to slide the camera
	if vector != Vector2.ZERO:
		lastVelocity = vector
		
	move_and_slide()
	
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Inventory"):
		if owner.get_parent().has_node("InventoryUI"):
			var invUI = owner.get_parent().get_node("InventoryUI")
			if invUI != null:
				invUI.queue_free()
		else:
			var ui = InventoryUI.instantiate()
			ui.Populate(ourInventory)
			owner.get_parent().add_child(ui)
			
	
func _unhandled_input(event: InputEvent) -> void:
	pass
	
func AddItemToInventory(item: Item) -> void:
	ourInventory.AddItem(item)
	#ourInventory.PrintInventoryItems()

#Not sure this is the best way to do this
#Do we pass in what we are looking for
#Example, door key
func CheckInventory() -> Inventory:
	return ourInventory
	
#This method is here to just call when testing to see if we have access to the player.	
func IAmThePlayer() -> void:
	get_node("BackGroundAudio/AudioStreamPlayer2D").stop()
	pass
