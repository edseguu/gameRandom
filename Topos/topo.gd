extends RigidBody2D

@onready var map_layer = $"../TileMapLayer"
@onready var timer = Timer.new()

func _ready() -> void:
	timer.autostart = true
	timer.wait_time = 1
	add_child(timer)
	timer.timeout.connect(func():
		var array_layer = map_layer.get_used_cells_by_id(1)
		var tile_random = array_layer.pick_random()
		var tile_random_pos = map_layer.map_to_local(tile_random)
		position = tile_random_pos
		)
	
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	pass
