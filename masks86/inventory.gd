class_name Inventory
extends Node2D


var items:  Dictionary = {}

func _ready() -> void:
	pass
	
func PrintInventoryItems() -> void:
	for k in items:
		print("Item: " + str(k) + " " + items[k])
		
func AddItem(item: Item)-> void:
	items.set(item.ItemID, item.Description)
	
