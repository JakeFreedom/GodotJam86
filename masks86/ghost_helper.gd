extends Sprite2D


@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var dialog: Dialog = $Dialog

func _ready() -> void:
	PlayIdle()
	dialog.SetMessageText("Hello", 4.0)	
	get_tree().create_timer(4).timeout.connect(DeleteGhost)

func PlayIdle() -> void:
	animation_player.play("Idle")
	
	
func DeleteGhost() -> void:
	queue_free()
