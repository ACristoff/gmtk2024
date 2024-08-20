extends Node2D

@export var next_level: PackedScene = null
@export var is_final_level: bool = false
@export var level_theme: AudioStreamMP3 = null

@onready var start = $Start
#@onready var death_zone = $Deathzone
@onready var hurt_sfx = null
@onready var player_healthbar = $CanvasLayer/MarginContainer/GridContainer/PlayerHealthbar
@onready var boss_healthbar = $CanvasLayer/MarginContainer/GridContainer/BossHealthbar

var player = null
var boss = null
var winCon = false
var boss_health = 200
var player_health = 100

func _ready():
	player = get_tree().get_first_node_in_group("player")
	boss = get_tree().get_first_node_in_group("boss")
	if level_theme != null:
		GlobalTheme.play_music_level(level_theme)
	pass

func _on_rat_hit_boss():
	boss_health -= 20
	boss_healthbar.value = boss_health
	if boss_health <= 0:
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_packed(next_level)
	pass # Replace with function body.

func _on_slime_boss_hit_player():
	player_health -= 20
	player_healthbar.value = player_health
	pass # Replace with function body.
