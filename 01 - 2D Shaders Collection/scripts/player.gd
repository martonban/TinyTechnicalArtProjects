extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -500.0

var gravity = 980

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("move_left", "move_right")
	if direction != 0:
		sprite.flip_h = (direction == -1)
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	update_animations()

func update_animations():
	if velocity.y < 0:
		sprite.play("jump")
	elif velocity.y > 0:
		sprite.play("fall")
	else:
		if velocity.x != 0:
			sprite.play("run")
		else:
			sprite.play("idle")
