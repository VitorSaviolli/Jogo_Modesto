extends CharacterBody2D

const SPEED = 100.0
const LEFT_DISTANCE = 3 * SPEED 
const RIGHT_DISTANCE = 3 * SPEED  

var move_direction = -1 
var distance_traveled = 0.0  

func _process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	patrol(delta)
	move_and_slide()

func patrol(delta: float) -> void:

	velocity.x = move_direction * SPEED
	distance_traveled += SPEED * delta 

	
	$AnimatedSprite2D.play("andar")

	
	if (move_direction == -1 and distance_traveled >= LEFT_DISTANCE) or (move_direction == 1 and distance_traveled >= RIGHT_DISTANCE):
		move_direction *= -1  
		distance_traveled = 0  
		$AnimatedSprite2D.scale.x = move_direction * -1 
