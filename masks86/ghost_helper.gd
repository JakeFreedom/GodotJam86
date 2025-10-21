extends Sprite2D


@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var dialog: Dialog = $Dialog

func _ready() -> void:
	PlayIdle()
	#get_tree().create_timer(30).timeout.connect(DeleteGhost)

func PlayIdle() -> void:
	animation_player.play("Idle")
	
	
func DeleteGhost() -> void:
	self.visible = false
	animation_player.stop()
	queue_free()
