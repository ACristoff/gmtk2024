extends CharacterBody2D
class_name Boss

@export var speed = 100
@export var jump = 100
@export var damage = 100
@export var gravity = 500

@onready var attack_timer = $AttackTimer
var attack_cooldown = null

var player_target = null
var player_target_direction = "left"
var direction = 0
var attacking = false

signal hit_player

func _ready():
	var get_player = get_tree().get_first_node_in_group("player")
	player_target = get_player
	attack_cooldown = attack_timer.get_wait_time()
	#attack_timer.


func get_distance():
	if ((player_target.global_position.x - global_position.x) <  0):
		return global_position.x - player_target.global_position.x
	else:
		return player_target.global_position.x - global_position.x

func _physics_process(delta):
	#print(attack_timer.time_left)
	if is_on_floor() == false && attacking == false:
		velocity.y += gravity * delta
	elif attacking == false:
		walk_towards()
	if attacking == true:
		jump_to()
	move_and_slide()
	pass

##Have the slime move towards the player
func walk_towards():
	if get_distance() < 130:
		return
	if player_target.global_position.x < global_position.x:
		player_target_direction = "left"
		velocity.x = -speed
		pass
	else:
		player_target_direction = "right"
		velocity.x = speed
	if get_distance() > 200 && get_distance() < 320 && attack_timer.time_left == 0:
		attacking = true
		velocity.x = 0
	pass

##Have the slime jump onto the player
func jump_to():
	var slime_tween = create_tween()
	var target_position = Vector2(
		player_target.global_position.x,
		player_target.global_position.y - 200
	)
	slime_tween.tween_property(self, "global_position", target_position, 1)
	slime_tween.finished.connect(drop_to)
	await slime_tween.finished
	drop_to()
	pass

func drop_to():
	attacking = false
	attack_timer.start(attack_cooldown)
	pass


func _on_splash_box_body_entered(body):
	print(body)
	##use direction
	hit_player.emit()
	velocity.x = 400
	player_target.velocity.x = -200
	pass # Replace with function body.
