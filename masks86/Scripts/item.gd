class_name Item
extends Node2D

signal PickUpItem

@export var visual: PackedScene
@export var ItemID: int
@export var Description: String

func _ready() -> void:
	get_node("Area2D").PickUpItem.connect(PickUpItemHandler)
	var vis = visual.instantiate()
	add_child(vis)
	
	
func PickUpItemHandler() -> void:
	#so what are we needing to accomplish right here
	#do we find a ref to the player and then interact with the inventory
	#should the inventory be a global for the player
	#should the player carry around the code and processes to accessd
	#I personally thing the player should ask to see the inventory
	#and should have to ask to take or put items(Not in a permissions) type way, but just 
	#in a messages type system
	var p = get_tree().get_first_node_in_group("Player") as Player
	p.AddItemToInventory(self)
	call_deferred("queue_free")
	
	
