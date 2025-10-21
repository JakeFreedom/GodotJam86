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
	#here is where we will need to add this sprite to the inventory bar slot
	var invBar: InventoryBar = get_tree().get_first_node_in_group("InventoryBar")
	#invBar.IAmTheInventoryBar()
	invBar.AddItem(i)
	items.append(i)
	#print("Item " + str(i.ItemID) + " was added: " + str(items.size()))
	
func GetInventory()-> Array:
	#print("currect inv count " + str(items.size()))
	return items
	
	
#Get all items from the inventory of type
func GetInventoryByType(typeID: int) -> Array:
	var itemsOfType: Array
	for i in items:
		if i.ItemType == typeID:
			itemsOfType.append(i)
			
	return itemsOfType
	
