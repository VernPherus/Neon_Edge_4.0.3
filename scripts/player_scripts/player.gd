class_name Player
extends CharacterBody2D

@onready var playerAnims : AnimationPlayer = $AnimationPlayer

var MAX_SPEED = 300.0
var SPEED = 70.0
var ACCELERATION = 20.0
var JUMP_VELOCITY = -400.0
var last_direction = Vector2.RIGHT

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var can_dash = false

func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_pressed("jump"):
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_pressed("move_right"):
		velocity.x += SPEED
	elif Input.is_action_pressed("move_left"):
		velocity.x -= SPEED
	else:
		velocity.x = 0

	
	move_and_slide()
	
	
	
