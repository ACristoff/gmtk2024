extends CharacterBody2D
class_name Boss

@export var speed = 100
@export var jump = 100
@export var damage = 100
@export var gravity = 500

var player_target = null
var player_target_direction = "left"

var direction = 0
var attacking = false

func _ready():
	var get_player = get_tree().get_first_node_in_group("player")
	player_target = get_player

func get_distance():
	if ((player_target.global_position.x - global_position.x) <  0):
		return global_position.x - player_target.global_position.x
	else:
		return player_target.global_position.x - global_position.x

func _physics_process(delta):
	if is_on_floor() == false && attacking == false:
		velocity.y += gravity * delta
	elif attacking == false:
		walk_towards()
	move_and_slide()
	pass

##Have the slime move towards the player
func walk_towards():
	if player_target.global_position.x < global_position.x:
		player_target_direction = "left"
		velocity.x = -speed
		pass
	else:
		player_target_direction = "right"
		velocity.x = speed
	if get_distance() > 200 && get_distance() < 320:
		#print('Attack!')
		attacking = true
		velocity.x = 0
		jump_to()
	pass

##Have the slime jump onto the player
func jump_to():
	print('jumping to!')
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
