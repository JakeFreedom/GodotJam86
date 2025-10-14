extends Node2D

@onready var area_2d: Area2D = $Area2D

var keyType: String
var keyID: int

func _ready() -> void:
	area_2d.body_entered.connect(OnBodyEntered)
	pass
	
func OnBodyEntered() -> void:
	pass
