class_name Dialog
extends Node2D


@onready var messageText: Label = $Sprite2D/Label
@onready var sprite_2d: Sprite2D = $Sprite2D

var startFade: bool = false

func _ready() -> void:
	get_tree().create_timer(10).timeout.connect(DeleteMessage)
	
	pass


func _process(delta: float) -> void:
	if startFade:
		sprite_2d.modulate.a = sprite_2d.modulate.a - delta
	pass

func StartFade() -> void:
	startFade = true

func SetMessageText(message: String, fadeStartTime: float) -> void:
	messageText.text = message
	get_tree().create_timer(fadeStartTime).timeout.connect(StartFade)
	
	
func DeleteMessage() -> void:
	queue_free()
