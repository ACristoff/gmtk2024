extends CharacterBody2D

@onready var _animation_player = $AnimationPlayer
@onready var animated_sprite = $Sprite2D


func _input(_event):
	if Input.is_action_just_pressed("attack"):
		#print("attack!")
		_animation_player.play("attack")
	pass


	#if Input.is_action_just_pressed("attack"):
		#print("attack!")
		#actor._animation_player.play("attack")


func _on_animation_player_animation_finished(anim_name):
	print(anim_name)
	pass # Replace with function body.
