class_name Player
extends CharacterBody2D

@onready var sprite : Sprite2D = $Sprite2D
@onready var animationTree : AnimationTree = $AnimationTree

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#player input
var movement_input = Vector2.ZERO
var jump_input = false
var jump_input_actuation = false
var climb_input = false 
var dash_input = false

#player_movement
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var last_direction = Vector2.RIGHT

#mechanics
var can_dash = true

#states
var current_state = null
var prev_state = null


func _ready():
	animationTree.active = true

func _physics_process(delta):
#	# Add the gravity.
#	if not is_on_floor():
#		velocity.y += gravity * delta
#
#	# Handle Jump.
#	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
#		velocity.y = JUMP_VELOCITY
#
#	# Get the input direction and handle the movement/deceleration.
#	# As good practice, you should replace UI actions with custom gameplay actions.
#	var direction = Input.get_axis("ui_left", "ui_right")
#	if direction:
#		velocity.x = direction * SPEED
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


