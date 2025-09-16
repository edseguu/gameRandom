extends TouchScreenButton

var escenas_random = [
	"res://ping_pong.tscn",
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pressed() -> void:
	for random in escenas_random:
		print(random)
		get_tree().change_scene_to_file(random)
	
	
