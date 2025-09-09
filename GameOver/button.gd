extends TouchScreenButton

var escenas_random = [
	"res://ping_pong.tscn",
]

func _on_pressed() -> void:
	print("POPO")
	for random in escenas_random:
		print(random)
		get_tree().change_scene_to_file(random)
	
