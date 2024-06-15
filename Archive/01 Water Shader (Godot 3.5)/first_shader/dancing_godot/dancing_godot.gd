extends TextureRect

onready var amplitude = material.get_shader_param("amplitude")

#  Getting data from shader
func _ready():
	print(amplitude)

# Upload Data to the GPU
func _on_AmplitudeController_amplitude_changed(value):
	amplitude.x = value
	material.set_shader_param("amplitude", amplitude)
	print(amplitude)
