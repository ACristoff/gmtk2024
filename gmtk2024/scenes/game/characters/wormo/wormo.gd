extends CharacterBody2D
class_name Player

@export var speed := 125.0
@export var gravity := 400
@export var jump_force := 100

@export var coyote_time = 0.3
var coyote_timer = 0.3

var active = true
var is_charging = false

@onready var animated_sprite = $AnimatedSprite2D
##TODO SFX

func jump_release(force):
	velocity.y = -force
	#coyote_timer = 0

func _physics_process(delta):
	if is_on_floor() == false:
		velocity.y += gravity * delta
		#coyote_timer -= 1 * delta
	if velocity.y > 500:
		velocity.y = 500
	var direction = 0
	velocity.x = direction * speed
	if active == true:
		if Input.is_action_just_released("jump"):
			jump_release(jump_force)
			jump_force = 100
			pass
		if Input.is_action_pressed("jump"):
			jump_force += 10
			pass
		direction = Input.get_axis("move_left", "move_right")
		if direction != 0:
			animated_sprite.flip_h = (direction == -1)
	velocity.x = direction * speed
	move_and_slide()
	update_animations(direction)
	pass

func update_animations(direction):
	if is_on_floor():
		if direction == 0:
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
