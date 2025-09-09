extends CharacterBody2D
@onready var sprite_player = $"Sprite2D"
@onready var sprite_player_smash = preload("res://assets/Topos/player_smash.png")
@onready var sprite_player_normal = preload("res://assets/Topos/player.png")
@export var speed = 400

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()


func _on_area_2d_player_area_entered(area: Area2D) -> void:
	sprite_player.texture = sprite_player_smash


func _on_area_2d_player_area_exited(area: Area2D) -> void:
	sprite_player.texture = sprite_player_normal
