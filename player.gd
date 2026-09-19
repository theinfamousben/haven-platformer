extends CharacterBody2D


const SPEED = 450.0
const JUMP_VELOCITY = -700.0
const STARTING_X = 0
const STARTING_Y = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	loop(delta)

	move_and_slide()
	
func loop(delta: float) -> void:
	if position.y > 10000: die()
	
func die() -> void:
	position = Vector2(STARTING_X, STARTING_Y)
