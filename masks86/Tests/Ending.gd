extends Node2D

@onready var area_2d: Area2D = $Area2D



var ghostHelperScene = preload("res://ghostHelper.tscn")
var closeButtonScenee = preload("res://end_menu.tscn")
var creditsScene = preload("res://end_menu.tscn")


func _ready()-> void:
	area_2d.body_entered.connect(ShowEnding)


func ShowEnding(otherBody: Node2D)->void:
	#var ghosty = ghostHelperScene.instantiate()
	#var end = closeButtonScenee.instantiate()
	#get_tree().get_first_node_in_group("MainCam").add_child(ghosty)
	#get_tree().get_first_node_in_group("Player").IAmThePlayer()
	#
	#ghosty.dialog.SetMessageText("You have made it to the end! I hope you enjoyed solving the puzzles. Thank you so much for playing!!!", 30.0)
	#
	get_tree().change_scene_to_file("res://end_menu.tscn")
	
