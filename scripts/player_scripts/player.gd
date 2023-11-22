class_name Player
extends CharacterBody2D

@onready var sprite : Sprite2D = $Sprite2D


var SPEED = 550.0
var JUMP_VELOCITY = -2000.0
var ACCELERATION = 50.0
var FRICTION = 70

var MAX_JUMPS = 2
var JUMP_NUM = 1

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready():
	pass

func _physics_process(delta):
	
	var input_dir : Vector2 = input()
	
	if input_dir != Vector2.ZERO:
		accelerate(input_dir)
	else: friction()
	
	jump()
	
	move_and_slide()

func input() -> Vector2:
	var input_dir = Vector2.ZERO
	
	input_dir.x = Input.get_axis("move_left", "move_right")
	input_dir = input_dir.normalized()
	return input_dir

func accelerate(direction):
	velocity = velocity.move_toward(SPEED * direction, ACCELERATION)

func friction():
	velocity = velocity.move_toward(Vector2.ZERO, FRICTION)

func jump():
	if Input.is_action_just_pressed("jump"):
		if JUMP_NUM < MAX_JUMPS:
			velocity.y = JUMP_VELOCITY
			JUMP_NUM += 1
			
	else: 
		velocity.y += gravity
	
	if is_on_floor():
		JUMP_NUM = 1
