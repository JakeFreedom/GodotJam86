extends Node2D


@export var POIScene: PackedScene
@export var poiObject: Texture2D
@export var roomObject: Texture2D #This is optional
@export var POIPos: Vector2

@onready var sw_table: Area2D = $SWTable
@onready var h_box_container: HBoxContainer = $"../Camera2D/Control/VBoxContainer/HBoxContainer"


func _ready() -> void:
	sw_table.body_entered.connect(OnBodyEntered)
	
func OnBodyEntered(otherBody: CharacterBody2D)-> void:
	
	#When this happens if its the player
	#we are going to spawn the POIScene, then inject the objects
	#These will be objects we can't pick, but just look at.
	if otherBody is Player:
		var poi = POIScene.instantiate();
		#owner.add_child(poi)
		h_box_container.add_child(poi)
		poi.SetPOIObject(poiObject)
		poi.SetRoomObject(roomObject)
		poi.SetPOIObjectPosition(POIPos)
		get_tree().paused = true
	pass
