extends CharacterBody2D
class_name Player

@export var speed := 125.0
@export var gravity := 500
@export var jump_force := 100

@export var max_jump := 500
@export var jump_acceleration = 5

var active := true
var is_charging := false
var is_maxxed = jump_force > max_jump

@onready var animated_sprite = $AnimatedSprite2D
##TODO SFX 

func jump_release(force):
	velocity.y = -force

func _physics_process(delta):
	if is_on_floor() == false:
		velocity.y += gravity * delta
	if velocity.y > 0:
		animated_sprite.flip_v = true
	else:
		animated_sprite.flip_v = false
	if velocity.y > 500:
		velocity.y = 500
	var direction = 0
	velocity.x = direction * speed
	if active == true:
		if Input.is_action_just_released("jump") && is_on_floor() == true:
			jump_release(jump_force)
			is_charging = false
			jump_force = 100
			pass
		if Input.is_action_pressed("jump") && is_on_floor() == true:
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
	velocity.x = direction * speed
	move_and_slide()
	update_animations(direction)
	pass

func update_animations(direction):
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

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
