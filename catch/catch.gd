extends Node2D

var enemy_random = [
	preload("res://shoe.tscn"),
	preload("res://cell.tscn"),
	preload("res://cake.tscn")
]

@onready var path_follow = $Path2D/PathFollow2D
@onready var spawn_point = $Path2D/PathFollow2D/Spawn


func _on_timer_timeout() -> void:
	var enemy_selected_random = enemy_random.pick_random()
	
	var new_enemy = enemy_selected_random.instantiate()
	new_enemy.global_position = spawn_point.global_position
	
	add_child(new_enemy)
