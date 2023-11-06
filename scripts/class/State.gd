class_name State
extends Node

@export var can_move : bool = true

signal Transitioned

var entity : CharacterBody2D

func state_input(event : InputEvent):
	pass

func enter():
	pass

func exit():
	pass

func update(_delta : float):
	pass

func physics_update(_delta : float):
	pass
