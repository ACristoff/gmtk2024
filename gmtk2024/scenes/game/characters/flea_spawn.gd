extends CharacterBody2D

var jumped = false
@export var gravity := 500


func lunge():
	$AnimationPlayer.play("fela")
	jumped = true
	$Flea.visible = true
	$Fleaspawn.visible = false
	velocity.y -100
	print("flea: RAH!")

func _physics_process(delta):
	if jumped == true:
		print("flea is succumbing to gravity")
		velocity.y += gravity * delta

func _on_area_2d_body_entered(body):
	if body.has_method("shake"):
		$AnimationPlayer2.play("spawn")
		print("a flea smells the worm")
