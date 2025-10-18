class_name InventorySlot
extends Control


signal Selected

#background sprite
@onready var sprite_2d: Sprite2D = $BackGround
#Item Sprite
@onready var sprite_2d_2: Sprite2D = $Sprite2D2

var selectedItem = preload("res://Imports/InventorySlotBackGround_Selected.png")
var normalItem = preload("res://Imports/InventorySlotBackGround.png")
var isSet: bool = false
var slotItem: Item
var IAmSelected: bool = false

func _ready() -> void:
	pass
	
func SetSlotItem(item: Item):
	#print("Set Slot" + str(item.ItemID))
	slotItem = item 
	isSet = true
	sprite_2d_2.texture = item.ItemTexture
	sprite_2d_2.scale = item.scaleOverRide

func DeSelectSlot()-> void:
	IAmSelected = false
	sprite_2d.texture = normalItem

func IAmTheInventorySlot()-> void:
	if slotItem != null:
		var slots: Array = get_parent().get_children()
		for k in slots:
			k.DeSelectSlot()
		slotItem.isSelected = true
		sprite_2d.texture = selectedItem
		IAmSelected = true
		Selected.emit()
