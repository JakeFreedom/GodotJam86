extends Panel


signal On_KeyCodeEntered(code: Array)

var keyPresses: int = 0
var code: Array
@onready var close_button: Button = $CloseButton


func _ready()-> void:
	close_button.pressed.connect(OnClosePressed)




func OnClosePressed() -> void:
	print("close window")
	get_tree().paused = false
	queue_free()


func PrintNumber(num) -> void:
	code.append(num)
	keyPresses+=1
	if keyPresses == 4:
		On_KeyCodeEntered.emit(code)
		code.clear()
		keyPresses = 0
