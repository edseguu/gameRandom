extends Label
@onready var topo = get_node("../Topo")


	
func _process(delta: float) -> void:
	var life_string = str(topo.life)
	set_text("Eat: " + life_string)
