extends Area2D


@onready var player_texture = $Sprite2D
@onready var player_state = preload("res://assets/catch/player_state.png")
func _ready() -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("trash"):
		get_tree().change_scene_to_file("res://game_over.tscn")
