extends Control

@onready var poi: Sprite2D = $POI
@onready var room_object: Sprite2D = $RoomObject
@onready var button: Button = $Button

func _ready() -> void:
	button.pressed.connect(OnClosedClicked)
	pass

func OnClosedClicked()->void:
	get_tree().paused = false
	call_deferred("queue_free")
	
	
func SetPOIObject(texture: Texture2D)->void:
	poi.texture = texture
	
func SetRoomObject(texture: Texture2D)->void:
	room_object.texture = texture
	
func SetPOIObjectPosition(pos: Vector2) -> void:
	poi.position=pos
