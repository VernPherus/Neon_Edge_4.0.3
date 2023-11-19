class_name Player
extends CharacterBody2D

@onready var sprite : Sprite2D = $Sprite2D


@export var SPEED = 300.0
var JUMP_VELOCITY = -900.0


var gravity = 50.0

var movement_input = Vector2.ZERO
var jump_input = false
var jump_input_actuation = false
var climb_input = false 
var dash_input = false
var can_dash = false

func _ready():
	pass

func _physics_process(delta):
	
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

