extends Area2D

@onready var Shoe_node = $"../Shoe"

func _process(delta: float) -> void:
	add_child(Shoe_node)
