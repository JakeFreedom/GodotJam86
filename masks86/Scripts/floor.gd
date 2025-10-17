extends Node2D

@export var floorTile: Texture2D

func _ready() -> void:
	GenerateFloor()
	pass
	
	
func GenerateFloor() -> void:
	var xPos: int = -8192
	var yPos: int = -8192
	
	
	while yPos < 8192:
		var tile : Sprite2D = Sprite2D.new()
		
		tile.texture = floorTile
		tile.scale = Vector2(.5,.5)
		tile.position = Vector2(xPos, yPos)
		add_child(tile)
		xPos+=128
		if xPos >= 8192:
			xPos = -8192
			yPos += 128
		pass
