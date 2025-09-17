extends Panel




func _input(event: InputEvent) -> void:
	
	if event is InputEventScreenDrag:
		var jugador = get_node("../..")
		if get_rect().has_point(event.position):
			jugador.position.x = event.position.x
			jugador.position.y = jugador.position.y
		
