extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var vida = 5

# Função de fisica do personagem
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
#	Pega o estado atual do boneco
	_get_input()
	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()

#Troca a animação do player
func _get_input():
	var direction = int(Input.is_action_pressed("rigth")) - int(Input.is_action_pressed("left"))
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.play("repouso")
	
	if direction != 0:
		$AnimatedSprite2D.scale.x = direction
		$AnimatedSprite2D.play("andando")
	
