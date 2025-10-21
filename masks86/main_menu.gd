extends Control
@onready var new_game: Button = $"New Game"
@onready var quit: Button = $Quit
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready()-> void:
	new_game.pressed.connect(StartGame)
	quit.pressed.connect(Quit)
	audio_stream_player_2d.play()
	
	
func StartGame() -> void:
	get_tree().change_scene_to_file("res://Tests/room_testing.tscn")
	pass
	
func Quit() -> void:
	get_tree().quit()
