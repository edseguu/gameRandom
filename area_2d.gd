extends Area2D

@onready var trash = [
	load("res://shoe.tscn")
]

func _ready() -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("trash"):
		print("SHOE ENTRPO")
		#Añadir lógica de game over
