class_name playerStateManager
extends Node

@export var player : CharacterBody2D
@export var initial_state : State

var current_state : State
var states : Dictionary = {}

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			
			states.entity = player
	
	if initial_state:
		initial_state.enter()
		current_state = initial_state

func _physics_process(delta):
	pass

func check_if_can_move():
	return current_state.can_move

func switch_state(new_state : State):
	current_state.exit()
	
	new_state.enter()
	current_state = new_state
