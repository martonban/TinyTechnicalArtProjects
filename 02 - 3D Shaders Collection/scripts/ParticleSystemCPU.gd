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
	var p_lifetime: float 
	
var shader
var particles: Array[Particle]

func _ready():
	shader = _2d_particles_cpu.get_active_material(0)
	for n in number_of_particals:
		var p = Particle.new()
		p.p_pos = source
		p.p_radius = radius
		p.p_lifetime = 1;
		particles.append(p)

	
func _process(delta):
	var array_to_shader: Array[float]
	for n in number_of_particals:
		particles[n].p_pos.y += 0.001
		particles[n].p_lifetime -= 0.01
		array_to_shader.append(particles[n].p_pos.x)
		array_to_shader.append(particles[n].p_pos.y)
		array_to_shader.append(particles[n].p_radius)
		array_to_shader.append(particles[n].p_lifetime)
	shader.set_shader_parameter("array", array_to_shader);
	#array_to_shader.clear()

func generate_random_float_x() -> float:
	var min_value: float = 0
	var max_value: float = 0.05
	return randf_range(min_value, max_value) / 5;
