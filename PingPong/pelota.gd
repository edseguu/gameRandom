extends RigidBody2D
const FUERZA_IMPULSO_JUGADOR = 1900.0


func _ready() -> void:
	# Le damos un impulso inicial aleatorio para que empiece a moverse.
	#var direccion_inicial = Vector2.RIGHT.rotated(randf_range(0, TAU))
	#apply_central_impulse(direccion_inicial * 500)
	pass
	
@warning_ignore("unused_parameter")
func _physics_process(delta: float) -> void:
	pass


func _on_body_entered(body: Node) -> void:
	if body.name == "player":
		var direccion_rebote = (self.global_position - body.global_position).normalized()
		
		# --- LA PARTE MÁS IMPORTANTE ---
		# Forzamos que la pelota SIEMPRE vaya hacia arriba para cumplir tu objetivo.
		# Si el vector 'y' es positivo (apunta hacia abajo en Godot), lo hacemos negativo.
		if direccion_rebote.y > -0.5: # Usamos -0.2 para evitar rebotes muy horizontales
			direccion_rebote.y = -abs(direccion_rebote.y)
			if direccion_rebote.y > -1: # Si es casi horizontal, dale más fuerza vertical
				direccion_rebote.y = -15

		# Finalmente, aplicamos el impulso controlado.
		# Asignar linear_velocity directamente nos da un control total y anula
		# la velocidad que tenía la pelota, asegurando un impulso consistente.
		self.linear_velocity = direccion_rebote.normalized() * FUERZA_IMPULSO_JUGADOR
		print("¡Impulso aplicado por el jugador!")
	if body.name == "Enemy":
		var direccion_rebote = (self.global_position - body.global_position).normalized()
		
		# --- LA PARTE MÁS IMPORTANTE ---
		# Forzamos que la pelota SIEMPRE vaya hacia arriba para cumplir tu objetivo.
		# Si el vector 'y' es positivo (apunta hacia abajo en Godot), lo hacemos negativo.
		if direccion_rebote.y < 0.6: # Usamos -0.2 para evitar rebotes muy horizontales
			direccion_rebote.y = abs(direccion_rebote.y)
			if direccion_rebote.y < 0.3: # Si es casi horizontal, dale más fuerza vertical
				direccion_rebote.y = 0.5

		# Finalmente, aplicamos el impulso controlado.
		# Asignar linear_velocity directamente nos da un control total y anula
		# la velocidad que tenía la pelota, asegurando un impulso consistente.
		self.linear_velocity = direccion_rebote.normalized() * FUERZA_IMPULSO_JUGADOR
		print("¡Impulso aplicado por el enemigo!")
