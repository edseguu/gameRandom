extends CharacterBody2D
@onready var sprite_player = $"Sprite2D"
@onready var area2D = $Area2DPlayer
@onready var sprite_player_smash = preload("res://assets/Topos/player_smash.png")
@onready var sprite_player_normal = preload("res://assets/Topos/player.png")
@export var speed = 400

func _physics_process(delta):
	move_and_slide()


func _on_area_2d_player_area_entered(area: Area2D) -> void:
	sprite_player.texture = sprite_player_smash
	
	


func _on_area_2d_player_area_exited(area: Area2D) -> void:
	sprite_player.texture = sprite_player_normal


func _on_topo_2_body_entered(body: Node) -> void:
	print("OK GOLPE A TOPO2 ") # Replace with function body.
