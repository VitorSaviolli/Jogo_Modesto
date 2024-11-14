extends Area2D

func _on_body_entered(body: Node2D) -> void:
	var collision_position_global = body.global_position
	
	if collision_position_global <= body.position:
		if body.name == "player":
			$AnimatedSprite2D.scale.x = 1
			$AnimatedSprite2D.play("atacar")

	elif collision_position_global >= body.position:
		if body.name == "player":
			$AnimatedSprite2D.scale.x = -1
			$AnimatedSprite2D.play("atacar")

func _on_body_exited(body: Node2D) -> void:
	$AnimatedSprite2D.play("andar")
