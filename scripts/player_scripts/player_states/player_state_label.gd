extends Label

@export var stateManager : player_STATES_mananger

func _process(delta):
	text = "STATE : " + stateManager.currentState.name

