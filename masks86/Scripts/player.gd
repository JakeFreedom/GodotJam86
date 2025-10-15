class_name Player
extends CharacterBody2D


@export var InventoryUI: PackedScene

var lastVelocity: Vector2
var ourInventory

func _ready() -> void:
	ourInventory = get_node("Inventory") as Inventory

func _process(delta: float) -> void:
	var vector = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = vector * 800 
	
	if vector != Vector2.ZERO:
		lastVelocity = vector
		
	move_and_slide()
	
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Inventory"):
		var invUI = owner.get_parent().get_node("InventoryUI")
		if invUI != null:
			invUI.queue_free()
		else:
			var ui = InventoryUI.instantiate()
			ui.Populate(ourInventory)
			owner.get_parent().add_child(ui)
		
	pass
	
func _unhandled_input(event: InputEvent) -> void:
	pass
	
func AddItemToInventory(item: Item) -> void:
	ourInventory.AddItem(item)
	#ourInventory.PrintInventoryItems()
