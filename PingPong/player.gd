# En el script de tu CharacterBody2D
extends CharacterBody2D
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	move_and_slide()
