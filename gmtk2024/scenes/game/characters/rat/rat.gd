extends CharacterBody2D

@onready var _animation_player = $AnimationPlayer
@onready var animated_sprite = $Sprite2D
@onready var bite_box = $BiteBox/CollisionShape2D

func _ready():
	#bite_box.set_process(false)
	bite_box.disabled = true

func _input(_event):
	if Input.is_action_just_pressed("attack"):
		#print("attack!")
		_animation_player.play("attack")
	pass


func bite():
	print("KILLING BITES")
	bite_box.disabled = false
	#bite_box.set_process(true)
	#if Input.is_action_just_pressed("attack"):
		#print("attack!")
		#actor._animation_player.play("attack")

func finish_bite():
	bite_box.disabled = true
	pass

func _on_animation_player_animation_finished(anim_name):
	#print(anim_name)
	pass # Replace with function body.
