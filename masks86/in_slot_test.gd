class_name InventorySlot
extends Control


#background sprite
@onready var sprite_2d: Sprite2D = $BackGround
#Item Sprite
@onready var sprite_2d_2: Sprite2D = $Sprite2D2

var selectedItem = preload("res://Imports/InventorySlotBackGround_Selected.png")
var isSet: bool = false
var slotItem: Item

func _ready() -> void:
	pass
	
func SetSlotItem(item: Item):
	#print("Set Slot" + str(item.ItemID))
	slotItem = item 
	isSet = true
	sprite_2d_2.texture = item.ItemTexture
	sprite_2d_2.scale = item.scaleOverRide


func IAmTheInventorySlot()-> void:
	sprite_2d.texture = selectedItem
	print("I am the inventory slot")
	
