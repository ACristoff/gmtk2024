extends CharacterBody2D


@export var speed = 100
@export var jump = 100
@export var damage = 100
@export var gravity = 500

var player_target = null

var direction = 0
var override_x = false

func _ready():
	var get_player = get_tree().get_first_node_in_group("player")
	player_target = get_player
	print(player_target)

func _physics_process(delta):
	if is_on_floor() == false:
		velocity.y += gravity * delta
	move_and_slide()
	pass

##Have the slime move towards the player
func walk_towards():
	pass

##Have the slime jump onto the player
func jump_to():
	pass

#class_name MonsterMovement
#extends Node

#@export var actor: CharacterBody2D
#
#var direction = 0
#
#func _input(_event):
	#pass
#
#func _physics_process(delta):
	#if actor.is_on_floor() == false:
		#actor.velocity.y += gravity * delta
	#direction = Input.get_axis("move_left", "move_right")
	#actor.direction = direction
	#if direction != 0:
		#actor.animated_sprite.flip_h = (direction == -1)
	#if actor.is_on_floor() == true && actor.override_x == false:
		#actor.velocity.x = direction * speed
	#actor.move_and_slide()
	#pass
#
#func update_animations(_direction):
	#pass
