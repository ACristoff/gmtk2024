class_name MonsterMovement
extends Node

@export var speed = 100
@export var jump = 100
@export var damage = 100
@export var gravity = 500

@export var actor: CharacterBody2D

var direction = 0

func _input(_event):
	pass

func _physics_process(delta):
	#print(actor.velocity)
	if actor.is_on_floor() == false:
		actor.velocity.y += gravity * delta
	direction = Input.get_axis("move_left", "move_right")
	actor.direction = direction
	if direction != 0:
		actor.animated_sprite.flip_h = (direction == -1)
	if actor.is_on_floor() == true && actor.override_x == false:
		actor.velocity.x = direction * speed
	actor.move_and_slide()
	#update_animations(direction)
	pass

#if is_on_floor() == true && Input.is_action_just_released("jump") == false && Input.is_action_pressed("jump") == false:
		#velocity.x = direction * speed

func update_animations(_direction):
	pass
