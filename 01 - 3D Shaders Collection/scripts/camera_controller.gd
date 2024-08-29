extends Node3D

@export_range(1.0, 10.0) var move_speed: float = 2
@export_range(0.001, 0.02) var lookaround_speed: float = 0.005

var right_button_down = false
var camera_rotation := Vector2.ZERO

func _process(delta):
	if Input.is_action_just_pressed("camera_move_mode"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if Input.is_action_just_released("camera_move_mode"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if Input.is_action_just_pressed("camera_speed_up"):
		move_speed = 4
	if Input.is_action_just_released("camera_speed_up"):
		move_speed = 2
	
	if Input.is_action_pressed("camera_move_mode"):
		if Input.is_action_pressed("move_forward"):
			translate(Vector3.FORWARD * delta * move_speed)
		if Input.is_action_pressed("move_backward"):
			translate(Vector3.BACK * delta * move_speed)
		if Input.is_action_pressed("move_left"):
			translate(Vector3.LEFT * delta * move_speed)
		if Input.is_action_pressed("move_right"):
			translate(Vector3.RIGHT * delta * move_speed)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			right_button_down = event.pressed
	if event is InputEventMouseMotion:
		if right_button_down == true:
			camera_rotation += event.relative * lookaround_speed * -1.0
			transform.basis = Basis() # Reset
			rotate_object_local(Vector3(0, 1, 0), camera_rotation.x) # Rotate in Y
			rotate_object_local(Vector3(1, 0, 0), camera_rotation.y) # Rotate in X
