extends Area2D
@onready var score = $"../Score"
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Pelota":
		get_tree().reload_current_scene()
		#var scoreString = score.get_text()
		#var scoreNewInt = int(scoreString)
		#scoreNewInt += 1
		#var scoreNewString = str(scoreNewInt)
		#print(scoreNewString)
		#score.set_text(scoreNewString)
