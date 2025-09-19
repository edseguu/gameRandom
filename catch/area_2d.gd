extends Area2D


@onready var player_texture = $Sprite2D
@onready var player_nomral = preload("res://assets/catch/player_normal.png")
@onready var player_state = preload("res://assets/catch/player_state.png")

@onready var audio_eat = $AudioStreamPlayer2D





func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("trash"):
		get_tree().change_scene_to_file("res://game_over.tscn")
		
	if body.is_in_group("food"):
		player_texture.texture = player_nomral
		audio_eat.play()


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("food"):
		player_texture.texture = player_state
