extends MeshInstance3D

@onready var _2d_particles_cpu = $"."


@export_category("Particle System")
@export_range(0, 300) var number_of_particals: int
@export var source: Vector2


@export_category("Particle")
@export var radius: float

class Particle:
	var p_pos: Vector2
	var p_radius: float
	
var particles: Array[Particle] = []
var shader


func _ready():
	shader = _2d_particles_cpu.get_active_material(0)
	for n in number_of_particals:
		var p = Particle.new()
		p.p_pos = source
		p.p_radius = radius
		particles.append(p)
	shader.set_shader_parameter("size", number_of_particals)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var array_to_shader: Array[float] = [number_of_particals * 3] 
	for n in number_of_particals:
		particles[n].p_pos += Vector2(generate_random_float(), generate_random_float_x()) * 10 * delta
		array_to_shader.append(particles[n].p_pos.y)
		array_to_shader.append(particles[n].p_pos.x)
		array_to_shader.append(particles[n].p_radius)
	
	shader.set_shader_parameter("array", array_to_shader);

func generate_random_float() -> float:
	var min_value: float = 0.01
	var max_value: float = 0.05
	return randf_range(min_value, max_value)
	
func generate_random_float_x() -> float:
	var min_value: float = -0.1
	var max_value: float = 0.1
	return randf_range(min_value, max_value)
