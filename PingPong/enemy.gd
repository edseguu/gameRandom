# En el script de tu CharacterBody2D
extends CharacterBody2D

var contador_enemy = 0
var velocidad_movimiento = 820.0 

@onready var pelota = $"../Pelota"

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if pelota:
		position.x = move_toward(position.x, pelota.position.x, velocidad_movimiento * delta)
	
	move_and_slide()

func _on_pelota_body_entered(body: Node) -> void:
	if body.name == "Enemy":
		contador_enemy += 1
		print(contador_enemy)
