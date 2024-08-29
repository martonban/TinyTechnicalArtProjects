extends OmniLight3D

var amplitude = 2
var frequency = 1
var elapsed_time = 0

func _process(delta):
	elapsed_time += delta
	
	var new_y = amplitude * cos(elapsed_time * frequency/2)
	var new_x = amplitude * sin(elapsed_time * frequency/2)
	
	# Állítsuk be a fény új pozícióját
	position.y = new_y
	position.x = new_x
