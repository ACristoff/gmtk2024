class_name MonsterMovement
extends Node

@export var speed = 100
@export var jump = 100
@export var damage = 100

@export var actor: CharacterBody2D

func _physics_process(delta):
	if Input.is_action_pressed("ui_down"):
		#print("test")
		actor._animation_player.play("attack")
		pass
	else:
		actor._animation_player.stop()
		pass
	pass
	
	pass
