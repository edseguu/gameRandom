extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass


func _input(event: InputEvent) -> void:
	
	if event is InputEventScreenDrag:
		var jugador = get_node("../..")
		if get_rect().has_point(event.position):
			jugador.position.x = event.position.x
			jugador.position.y = jugador.position.y
		
