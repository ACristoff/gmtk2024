extends CharacterBody2D

@onready var _animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_down"):
		_animation_player.play("attack")
		pass
	else:
		_animation_player.stop()
		pass
	pass
