class_name Player
extends CharacterBody2D

@onready var sprite : Sprite2D = $Sprite2D


<<<<<<< HEAD
var SPEED = 550.0
var JUMP_VELOCITY = -2000.0
var ACCELERATION = 50.0
var FRICTION = 70

var MAX_JUMPS = 2
var JUMP_NUM = 1

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

=======
@export var SPEED = 300.0
var JUMP_VELOCITY = -900.0


var gravity = 50.0

var movement_input = Vector2.ZERO
var jump_input = false
var jump_input_actuation = false
var climb_input = false 
var dash_input = false
var can_dash = false
>>>>>>> 3b871250187a8d241b8bc1af92dbcaec37797d82

func _ready():
	pass

func _physics_process(delta):
	
<<<<<<< HEAD
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
=======
	if Input.is_action_pressed("move_left"):
		velocity.x = -SPEED
	elif Input.is_action_pressed("move_right"):
		velocity.x = SPEED
	else: 
		velocity.x = 0
	
	if Input.is_action_just_pressed("jump") and jump_input == false:
		velocity.y = JUMP_VELOCITY
	
	if not is_on_floor():
		velocity.y += gravity   
		jump_input = true
	else:
		jump_input = false
	
	move_and_slide()



#func default(delta):
#	playerAnims.play("idle")
#
#	if not is_on_floor():
#		velocity.y += gravity
#		playerAnims.play("land")
#		if velocity.y > 2000:
#			velocity.y = 2000
#
#	if Input.is_action_pressed("move_right"):
#		velocity.x = SPEED
#		playerAnims.play("run")
#	elif Input.is_action_pressed("move_left"):
#		velocity.x = -SPEED
#		playerAnims.play("run")
#	else: 
#		velocity.x = 0
#		playerAnims.play("idle")
#
#	if Input.is_action_pressed("jump"):
#		if is_on_floor():
#			velocity.y = JUMP_VELOCITY
#			playerAnims.play("jump")
#
#	move_and_slide()

>>>>>>> 3b871250187a8d241b8bc1af92dbcaec37797d82
