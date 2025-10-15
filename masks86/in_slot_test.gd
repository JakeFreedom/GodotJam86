class_name InventorySlot
extends Control


@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	pass
	
func SetSlotItem(item: Item):
	print("Set Slot" + str(item.ItemID))
	
	pass
