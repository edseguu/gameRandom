extends CharacterBody2D
@onready var sprite_player = $"Sprite2D"
@onready var area2D = $Area2DPlayer
@onready var sprite_player_smash = preload("res://assets/Topos/player.png")
@onready var sprite_player_normal = preload("res://assets/Topos/player.png")
@export var speed = 400

func _physics_process(delta):
	move_and_slide()



	
	
