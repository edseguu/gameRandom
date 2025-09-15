extends Label

func _ready() -> void:
	pass
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	var int_text = int(text)
	var score_1 = int_text + 1
	var socore_1_str = str(score_1)
	set_text(socore_1_str)
	
