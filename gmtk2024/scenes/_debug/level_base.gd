extends Node2D

@export var next_level: PackedScene = null
@export var level_time = 60
@export var is_final_level: bool = false
var player = null
var timer_node = null
var time_left = null
var winCon = false
@onready var start = $Start
@onready var exit = null
@onready var death_zone = $Deathzone
@onready var hurt_sfx = null

@onready var hud = null

func _ready():
	player = get_tree().get_first_node_in_group("player")
	if player != null:
		player.global_position = start.get_spawn_pos()
	death_zone.body_entered.connect(_on_deathzone_body_entered)

func _on_deathzone_body_entered(body):
	print("oopsy woopsy!")
	reset_player()
	pass

func reset_player():
	player.velocity = Vector2.ZERO
	player.global_position = start.get_spawn_pos()
