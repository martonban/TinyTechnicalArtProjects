extends Node2D

@onready var sprite = $Sprite2D

func _process(delta):
	if Input.is_action_just_pressed("set_speed"):
		var new_speed = 10
		sprite.material.set_shader_parameter("speed", new_speed)
		var new_color = Vector4(randf(), randf(), randf(), 1.0)
		sprite.material.set_shader_parameter("color_example", new_color)
		
	# Get data from the shader
	var color = sprite.material.get_shader_parameter("color_example")
	print(color)
