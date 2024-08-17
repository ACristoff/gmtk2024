extends CharacterBody2D
class_name Player

@export var speed := 75.0
@export var gravity := 500
@export var jump_force := 100

@export var max_jump := 400
@export var jump_acceleration = 5
@export var jump_x_damp = 0.2

var active := true
var is_charging := false
var is_maxxed = jump_force > max_jump
var direction = 0

@onready var animated_sprite = $AnimatedSprite2D
##TODO SFX 
##TODO lock direction

func jump_release(force):
	#print(direction)
	velocity.y = -force
	if animated_sprite.flip_h == false:
		velocity.x = force * jump_x_damp
	else:
		velocity.x = (force * jump_x_damp) * -1

func _physics_process(delta):
	if is_on_floor() == false:
		velocity.y += gravity * delta
	if velocity.y > 0:
		animated_sprite.flip_v = true
	else:
		animated_sprite.flip_v = false
	if velocity.y > 500:
		velocity.y = 500
	if active == true:
		if Input.is_action_just_released("jump") && is_on_floor() == true:
			animated_sprite.offset = Vector2(0,0)
			jump_release(jump_force)
			is_charging = false
			jump_force = 100
			pass
		if Input.is_action_pressed("jump") && is_on_floor() == true:
			velocity.x = 0
			is_charging = true
			if jump_force < max_jump:
				jump_force += jump_acceleration
				pass
			pass
		if is_charging == false:
			direction = Input.get_axis("move_left", "move_right")
			pass
		if direction != 0:
			animated_sprite.flip_h = (direction == -1)
	if is_on_floor() == true && Input.is_action_just_released("jump") == false && Input.is_action_pressed("jump") == false:
		velocity.x = direction * speed
	move_and_slide()
	update_animations(direction)
	pass

func update_animations(direction):
	if jump_force == max_jump:
		shake()
	if is_on_floor():
		if direction == 0:
			if is_charging == true && animated_sprite.animation != "charge":
				animated_sprite.play("charge")
			elif is_charging == false:
				animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
		pass
	else:
		if velocity.y < 0:
			animated_sprite.play("jump")
		else:
			animated_sprite.play("fall")
		pass
	pass

func shake():
	var tween = get_tree().create_tween()
	var shake = 0.1
	var random = Vector2(randi_range(0,1), randi_range(0, 1))
	
	tween.tween_property(animated_sprite, "offset", random, 0.1)
	#prints("shake that shit!", random)
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
