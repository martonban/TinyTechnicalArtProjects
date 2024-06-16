extends Node3D

@onready var sphere = $FirstShader

func _process(_delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

	if Input.is_action_just_pressed("set_color"):
		# We need surface ID
		var first_shader_material = sphere.get_active_material(0)
		var random_color = Vector3(randf(), randf(), randf())
		first_shader_material.set_shader_parameter("sphere_color", random_color)
	
