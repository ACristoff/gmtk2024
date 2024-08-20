extends Node2D

@export var next_level: PackedScene = null
@export var is_final_level: bool = false
@export var level_theme: AudioStreamMP3 = null
var player = null
var winCon = false
@onready var start = $Start
#@onready var death_zone = $Deathzone
@onready var hurt_sfx = null
@onready var hud = null
var boss_health = 100
var player_health = 100

func _ready():
	player = get_tree().get_first_node_in_group("player")
	if level_theme != null:
		GlobalTheme.play_music_level(level_theme)
	pass

func _on_rat_hit_boss():
	boss_health -= 20
	prints('boss health:', boss_health)
	pass # Replace with function body.



#func _ready():
	#brian()
	#stage()
	#$Wormo.is_stage_rat = is_rat
	#$Wormo.is_stage_slime = is_slime
	#player = get_tree().get_first_node_in_group("player")
	#if player != null:
		#player.global_position = start.get_spawn_pos()
	#var monsters = get_tree().get_nodes_in_group("monster")
	#for monster in monsters:
		#monster.touched_player.connect(on_monster_touched_player)
	#death_zone.body_entered.connect(_on_deathzone_body_entered)
	#exit.body_entered.connect(_on_exit_body_entered)

#
#func _on_deathzone_body_entered(_body):
	##print("oopsy woopsy!")
	#reset_player()
	#pass
#
#func reset_player():
	#player.velocity = Vector2.ZERO
	#player.global_position = start.get_spawn_pos()
#
#func _on_exit_body_entered(body):
	#prints("exit reached", body)
	#winCon = true
	##Load next level here
	#pass
	#
#func brian():
	#if is_slime == true:
		#var tween = create_tween()
		#tween.tween_property($Slimebrain, "scale", Vector2(2.2, 1.9), 2)
		#tween.tween_property($Slimebrain, "scale", Vector2(1.9, 2.2), 2)
		#tween.tween_callback(brian)
#func stage():
	#if is_slime == true:
		#var tween = create_tween()
		#tween.tween_property($TileMapLayer2, "scale", Vector2(2.01, 1.99), 5)
		#tween.tween_property($TileMapLayer2, "scale", Vector2(1.99, 2.01), 5)
		#tween.tween_callback(stage)
#
#func on_monster_touched_player(monster):
	##print("touched by flea", monster)
	#reset_player()
	#pass
#
#
#func _on_slimedrip_slime() -> void:
	#is_slime = true
