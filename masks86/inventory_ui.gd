extends Control

@export var invSlot : PackedScene

func _ready() -> void:
	#when this is ready, we will walk the inventory that is passed in and
	#create slots for each item we have
	pass


func Populate(incomingInv:Inventory) -> void:
	var inventory: Array = incomingInv.GetInventory()
	for k in inventory:
		var slot = invSlot.instantiate() as InventorySlot
		slot.SetSlotItem(k)
		#print(k)
		#Here we are going to have to look up what the inventory piece on based on ID in some table
		#since all we are passing around is the dictionary that has ID an
