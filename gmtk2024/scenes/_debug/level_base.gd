extends Node2D

@export var next_level: PackedScene = null
@export var level_time = 60
@export var is_final_level: bool = false
@export var level_theme: AudioStreamMP3 = null
var player = null
var timer_node = null
var time_left = null
var winCon = false
@onready var start = $Start
@onready var exit = $Exit
@onready var death_zone = $Deathzone
@onready var hurt_sfx = null

@onready var hud = null

func _ready():
	player = get_tree().get_first_node_in_group("player")
	if player != null:
		player.global_position = start.get_spawn_pos()
	var monsters = get_tree().get_nodes_in_group("monster")
	for monster in monsters:
		monster.touched_player.connect(on_monster_touched_player)
	death_zone.body_entered.connect(_on_deathzone_body_entered)
	exit.body_entered.connect(_on_exit_body_entered)
	if level_theme != null:
		GlobalTheme.play_music_level(level_theme)

func _on_deathzone_body_entered(_body):
	#print("oopsy woopsy!")
	reset_player()
	pass

func reset_player():
	player.velocity = Vector2.ZERO
	player.global_position = start.get_spawn_pos()

func _on_exit_body_entered(body):
	prints("exit reached", body)
	winCon = true
	#Load next level here
	pass

func on_monster_touched_player(monster):
	#print("touched by flea", monster)
	pass
