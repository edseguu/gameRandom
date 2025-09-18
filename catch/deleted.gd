extends Area2D

func _on_body_entered(body: Node2D) -> void:
	# Esta línea se imprimirá en la consola cada vez que CUALQUIER cuerpo entre.
	print("¡Un cuerpo ha entrado! Se llama: ", body.name)

	if body is RigidBody2D:
		print(body.name, " es un RigidBody2D. ¡Borrando!")
		body.queue_free()
	else:
		print(body.name, " NO es un RigidBody2D.")
