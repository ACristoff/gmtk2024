extends Control

@export var level_theme: AudioStreamMP3 = null
@export var next_level: PackedScene = null


func _ready():
	if level_theme != null:
		GlobalTheme.play_music_level(level_theme)



func _on_start_game_pressed():
	get_tree().change_scene_to_packed(next_level)
	pass # Replace with function body.


func _on_controls_pressed():
	pass


func _on_exit_pressed():
	get_tree().quit()
	pass # Replace with function body.
