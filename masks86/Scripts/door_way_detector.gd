extends Node2D


@export var mainCam: Camera2D
@export var direction: Vector2 # Y=1 UP, Y=-1 Down, X=1 Right, X=-1 Left

@onready var area_2d: Area2D = $Area2D

var camStartingPosition
var SlideCam : bool = false
var incomingDirection: Vector2
var endingPosition: Vector2
var player: Player

func _ready() -> void:
	area_2d.body_entered.connect(OnBodyEntered)
	mainCam = get_tree().get_first_node_in_group("MainCam") as Camera2D
	
func _process(delta: float) -> void:
	if SlideCam:
		mainCam.position += incomingDirection * 500 * delta
		
		if incomingDirection == Vector2.UP or Vector2.DOWN:
			endingPosition.y = camStartingPosition.y-650 if incomingDirection == Vector2.UP else camStartingPosition.y+650
			if incomingDirection == Vector2.UP and mainCam.position.y <= endingPosition.y: 
				SlideCam = false
			elif incomingDirection == Vector2.DOWN and mainCam.position.y >= endingPosition.y:
				SlideCam = false

		if incomingDirection == Vector2.LEFT or Vector2.RIGHT:
			endingPosition.x = incomingDirection.x*(camStartingPosition.x+1200) if incomingDirection == Vector2.RIGHT else camStartingPosition.x-1200
			if incomingDirection == Vector2.RIGHT and mainCam.position.x >= endingPosition.x: 
				SlideCam = false
			elif incomingDirection == Vector2.LEFT and mainCam.position.x <= endingPosition.x:
				SlideCam = false

	
func OnBodyEntered(otherBody: Node2D) -> void:
	if not SlideCam:
		player = otherBody
		incomingDirection = player.lastVelocity
		camStartingPosition = mainCam.position
		#screen is 1080 in height
		if incomingDirection != Vector2.ZERO:
			SlideCam = true
		
