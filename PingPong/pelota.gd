extends RigidBody2D
const FUERZA_IMPULSO_JUGADOR = 2200.0
@onready var spriteParedDerecha = $"../RigidParedDerecha/ParedDerecha/Sprite2D"
@onready var spriteParedIzquierda = $"..//RigidParedIzquierda/ParedIzquierda/Sprite2D"
var textura_normal = preload("res://assets/ping_pong/wall.png")
var textura_estado = preload("res://assets/ping_pong/wallState.png")

@onready var sound = $AudioStreamPlayer2D

func _ready() -> void:
	position
	
@warning_ignore("unused_parameter")
func _physics_process(delta: float) -> void:
	pass


func _on_body_entered(body: Node) -> void:

	if body.name == "player":
		var direccion_rebote = (self.global_position - body.global_position).normalized()
		
		# --- LA PARTE MÁS IMPORTANTE ---
		# Forzamos que la pelota SIEMPRE vaya hacia arriba para cumplir tu objetivo.
		# Si el vector 'y' es positivo (apunta hacia abajo en Godot), lo hacemos negativo.
		if direccion_rebote.y > -0.2: # Usamos -0.2 para evitar rebotes muy horizontales
			direccion_rebote.y = -abs(direccion_rebote.y)
			if direccion_rebote.y > -1: # Si es casi horizontal, dale más fuerza vertical
				direccion_rebote.y = -15

		# Finalmente, aplicamos el impulso controlado.
		# Asignar linear_velocity directamente nos da un control total y anula
		# la velocidad que tenía la pelota, asegurando un impulso consistente.
		self.linear_velocity = direccion_rebote.normalized() * FUERZA_IMPULSO_JUGADOR
		print("¡Impulso aplicado por el jugador!")
		sound.play()
	if body.name == "Enemy":
		var direccion_rebote = (self.global_position - body.global_position).normalized()
		
		# --- LA PARTE MÁS IMPORTANTE ---
		# Forzamos que la pelota SIEMPRE vaya hacia arriba para cumplir tu objetivo.
		# Si el vector 'y' es positivo (apunta hacia abajo en Godot), lo hacemos negativo.
		if direccion_rebote.y < -10: # Usamos -0.2 para evitar rebotes muy horizontales
			direccion_rebote.y = abs(direccion_rebote.y)
			if direccion_rebote.y < 0.3: # Si es casi horizontal, dale más fuerza vertical
				direccion_rebote.y = 0.5

		# Finalmente, aplicamos el impulso controlado.
		# Asignar linear_velocity directamente nos da un control total y anula
		# la velocidad que tenía la pelota, asegurando un impulso consistente.
		self.linear_velocity = direccion_rebote.normalized() * FUERZA_IMPULSO_JUGADOR
		print("¡Impulso aplicado por el enemigo!")
		sound.play()






func _on_area_2d_pared_derecha_body_entered(body: Node2D) -> void:
	if name:
		spriteParedDerecha.texture = textura_estado

func _on_area_2d_pared_derecha_body_exited(body: Node2D) -> void:
	spriteParedDerecha.texture = textura_normal


func _on_area_2d_pared_izquierda_body_entered(body: Node2D) -> void:
	spriteParedIzquierda.texture = textura_estado


func _on_area_2d_pared_izquierda_body_exited(body: Node2D) -> void:
	spriteParedIzquierda.texture = textura_normal
