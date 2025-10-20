class_name InventoryBar

extends Control


func _ready() -> void:
	pass
	
	
	
func IAmTheInventoryBar() -> void:
	pass
	#print("Hello from the Inventory bar")
	
	
func AddItem(item: Item)->void:
	GetFirstEmptySlot(item)
	
	
func GetFirstEmptySlot(item: Item)-> void:
	var slots: Array = get_node("MarginContainer/HBoxContainer").get_children()
	
	for k in slots:
		if k.isSet == false:
			#this is the first slot that isn't set
			k.SetSlotItem(item)
			break
	

func RemoveItemFromBar(item: Item) -> void:
	var slots: Array = get_node("MarginContainer/HBoxContainer").get_children()
	
	for k in slots:
		if k.slotItem != null:
			if item.ItemID == k.slotItem.ItemID:
				k.isSet = false
				k.ClearItem()
			
			
			
			
			
