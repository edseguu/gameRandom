# En el script de tu CharacterBody2D
extends CharacterBody2D


var dentro_area = false
@onready var drag = $Controll_player/controll_topo_player

func _ready() -> void:
	pass
	

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	drag.is_dragging == false
	dentro_area = true
	if drag.is_dragging == false:
		print("OK")
