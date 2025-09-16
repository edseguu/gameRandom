extends RigidBody2D

@onready var map_layer = $"../TileMapLayer"
@onready var timer = Timer.new()
@onready var topo_sprite = $Sprite2DTopo
@onready var topo_normal = preload("res://assets/Topos/topo.png")
@onready var topo_2 = preload("res://assets/Topos/topo_2.png")
@onready var topo_3 = preload("res://assets/Topos/topo_3.png")

@onready var life = 100

@onready var tempo = get_tree().create_timer(2)

func _ready() -> void:
	timer.autostart = true
	timer.wait_time = 0.43
	add_child(timer)
	timer.timeout.connect(func():
		var array_layer = map_layer.get_used_cells_by_id(1)
		var tile_random = array_layer.pick_random()
		var tile_random_pos = map_layer.map_to_local(tile_random)
		position = tile_random_pos
		life -= 2
		if life < 30:
			topo_sprite.texture = topo_3
		if life < 70 and life > 30:
			topo_sprite.texture = topo_2
		if life > 70:
			topo_sprite.texture = topo_normal
		if life < 0:
			get_tree().change_scene_to_file("res://game_over.tscn")
			
		)


@warning_ignore("unused_parameter")
func _on_area_2d_player_area_entered(area: Area2D) -> void:
	life += 2
