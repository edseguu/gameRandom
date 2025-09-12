extends TouchScreenButton

var escenas_random = [
	"res://ping_pong.tscn",
	"res://topos.tscn"
]

func _on_pressed() -> void:
	var random_scene = escenas_random.pick_random()
	print(random_scene)
	get_tree().change_scene_to_file(random_scene)

	
