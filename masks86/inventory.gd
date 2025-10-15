class_name Inventory
extends Node2D

var items:  Array[Item]

func _ready() -> void:
	pass
	
func PrintInventoryItems() -> void:
	for k in items:
		print(k)
		
func AddItem(item: Item )-> void:
	var i = item.duplicate()
	items.append(i)
	
func GetInventory()-> Array:
	return items
	
