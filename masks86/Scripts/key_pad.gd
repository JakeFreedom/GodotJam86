extends Panel


signal On_KeyCodeEntered(code: Array)

var keyPresses: int = 0
var code: Array

@export var openedDoorTexture: Texture2D

@onready var close_button: Button = $CloseButton
@onready var keyPressAudio: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _ready()-> void:
	close_button.pressed.connect(OnClosePressed)

func OnClosePressed() -> void:
	get_tree().paused = false
	queue_free()

func PrintNumber(num) -> void:
	code.append(num)
	keyPresses+=1
	
	keyPressAudio.play()
	if keyPresses == 4:
		On_KeyCodeEntered.emit(code)#Handled in door.gd
		code.clear()
		keyPresses = 0


func TheDoorHasOpened() -> void:
	get_node("Wall/Decor13").texture = openedDoorTexture
