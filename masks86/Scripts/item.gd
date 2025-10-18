class_name Item
extends Node2D

signal PickUpItem

@onready var sprite_2d: Sprite2D = $Sprite2D

#@export var visual: PackedScene
@export var ItemTexture: Texture
@export var ItemID: int
@export var Description: String
@export var scaleOverRide: Vector2 = Vector2(1.0, 1.0)
@export var ItemType : int = 0 #See Note below
#################
#
# For now Keys will be type 1
# Masks will be type 2
# we will just add more as we need. Again, this is the wrong approach, but we are running out of time.
##

var isSelected: bool = false

func _ready() -> void:
	get_node("Area2D").PickUpItem.connect(PickUpItemHandler)
	sprite_2d.texture = ItemTexture
	sprite_2d.scale = scaleOverRide
	#var vis = visual.instantiate()
	#add_child(vis)
	
	
func PickUpItemHandler() -> void:
	#so what are we needing to accomplish right here
	#do we find a ref to the player and then interact with the inventory
	#should the inventory be a global for the player
	#should the player carry around the code and processes to accessd
	#I personally thing the player should ask to see the inventory
	#and should have to ask to take or put items(Not in a permissions) type way, but just 
	#in a messages type system
	#print(visual)
	var p = get_tree().get_first_node_in_group("Player") as Player
	p.AddItemToInventory(self)
	call_deferred("queue_free")
	#visible = false
	
	
