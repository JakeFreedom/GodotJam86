extends Node2D


@export var mainCam: Camera2D
@export var direction: Vector2 # Y=1 UP, Y=-1 Down, X=1 Right, X=-1 Left

@onready var area_2d: Area2D = $Area2D

var camStartingPosition
var SlideCam : bool = false
var incomingDirection: Vector2
var endingPosition: Vector2

func _ready() -> void:
	area_2d.body_entered.connect(OnBodyEntered)
	
func _process(delta: float) -> void:
	if SlideCam:
		mainCam.position += incomingDirection * 500 * delta
		
		if incomingDirection == Vector2.UP or Vector2.DOWN:
			endingPosition.y = incomingDirection.y*320 if incomingDirection ==Vector2.UP else incomingDirection.y*-358
			if incomingDirection == Vector2.UP and mainCam.position.y <= endingPosition.y: 
				SlideCam = false
			elif incomingDirection == Vector2.DOWN and mainCam.position.y >= -endingPosition.y:
				SlideCam = false
		if incomingDirection == Vector2.LEFT or Vector2.RIGHT:
			endingPosition.x = incomingDirection.x*1800 if incomingDirection == Vector2.RIGHT else incomingDirection.x-640
			if incomingDirection == Vector2.RIGHT and mainCam.position.x >= endingPosition.x: 
				SlideCam = false
			elif incomingDirection == Vector2.LEFT and mainCam.position.x <= -endingPosition.x:
				SlideCam = false
	
		print(endingPosition)
func OnBodyEntered(otherBody: Node2D) -> void:
	#print("scroll half screen in " + str(direction) + " direction")
	
	incomingDirection = otherBody.lastVelocity
	print(incomingDirection)
	camStartingPosition = mainCam.position
	#screen is 1080 in height
	if direction != Vector2.ZERO:
		SlideCam = true
