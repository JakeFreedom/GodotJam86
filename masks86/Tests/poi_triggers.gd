extends Node2D


@export var POIScene: PackedScene
@export var poiObject: Texture2D
@export var roomObject: Texture2D #This is optional
@export var POIPos: Vector2
@export var POIMirror: bool = false
@export var POIMirrorControlDoor: int = -1

@onready var sw_table: Area2D = $SWTable
@onready var h_box_container: HBoxContainer = $"../Camera2D/Control/VBoxContainer/HBoxContainer"


func _ready() -> void:
	sw_table.body_entered.connect(OnBodyEntered)
	
func OnBodyEntered(otherBody: CharacterBody2D)-> void:
	
	#When this happens if its the player
	#we are going to spawn the POIScene, then inject the objects
	#These will be objects we can't pick, but just look at.
	if otherBody is Player:
		if not POIMirror:
			var poi = POIScene.instantiate();
			#owner.add_child(poi)
			h_box_container.add_child(poi)
			poi.SetPOIObject(poiObject)
			poi.SetRoomObject(roomObject)
			poi.SetPOIObjectPosition(POIPos)
			get_tree().paused = true
		else:
			#for now we know this will be a mirror scene
			#We will know what door we are working with
			#We need to access the player and see if they are wearing the correct mask
			#then check that against the door that corresponds to this POI
			var p = otherBody as Player # get the player
			p.IAmThePlayer()
			var poi = POIScene.instantiate()
			h_box_container.add_child(poi)
			poi.SetPOIObject(poiObject)
			get_tree().paused = true
			pass
			
		#var doors: Array = get_tree().get_nodes_in_group("Door")
		#for d in doors:
			#d.PrintDoorCode()
	#This works great for things we just have to look at, the mirror is
	#something we have to look at. Some how we have to be able to find
	#all the doors and look at each one to see if it will open with the mask we have one.
