class_name player_STATES_mananger
extends Node

@export var character : CharacterBody2D
@export var animsTREE : AnimationTree
@export var initialState : player_State

var currentState : player_State

var STATES : Dictionary = {}

func _ready():
	for state in get_children():
		if (state is player_State):
			STATES[state.name] = state
			
			state.player = character
			state.playAnim = animsTREE
			
			state.Transitioned.connect(switch_states)
		
		if initialState:
			currentState = initialState

func _process(delta):
	if currentState:
		currentState.update(delta)

func _physics_process(delta):
	if currentState:
		currentState.physics_update(delta)

func _input(event):
	if currentState:
		currentState.state_input(event)

func switch_states(state, new_state_name): 
	
	if(state != currentState):
		return
	
	var new_state = STATES.get(new_state_name)
	if !new_state:
		return
	
	if currentState:
		currentState.exit()
	
	new_state.enter()
	currentState = new_state

