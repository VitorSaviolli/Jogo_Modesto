extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var vida = 5
var is_attacking = false

# Função de física do personagem
func _ready():
	# Conectando o sinal de fim de animação ao método
	$AnimatedSprite2D.connect("animation_finished", Callable(self, "_on_animation_finished"))


func _physics_process(delta: float) -> void:
	# Adiciona gravidade
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Pega o estado atual do boneco
	_get_input()
	
	# Lógica de pulo
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Lógica de ataque
	if Input.is_action_just_pressed("shot") and not is_attacking:
		is_attacking = true
		$AnimatedSprite2D.play("atacando")
	
	move_and_slide()

# Troca a animação do player
func _get_input():
	# Se está atacando, evita trocar de animação
	if is_attacking:
		return

	var direction = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.play("repouso")
	
	if direction != 0:
		$AnimatedSprite2D.scale.x = direction
		$AnimatedSprite2D.play("andando")

# Função para resetar o estado de ataque quando a animação termina
func _on_animation_finished():
	if $AnimatedSprite2D.animation == "atacando":
		is_attacking = false
