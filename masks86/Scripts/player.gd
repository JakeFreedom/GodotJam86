class_name Player
extends CharacterBody2D



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
	
func AddItemToInventory(item: Item) -> void:
	ourInventory.AddItem(item)
	ourInventory.PrintInventoryItems()
