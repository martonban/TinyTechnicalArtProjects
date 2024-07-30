extends MeshInstance3D

# Game Object
@onready var _2d_particles_cpu = $"."
@onready var timer = $Timer

# Particle System parameters
@export_category("Particle System")
@export_range(0, 300) var number_of_particals: int
@export var source: Vector2

# ONE Particle parameters
@export_category("Particle")
@export var radius: float

# Init global varriabels
var shader
var particle_system


# Class Definations 
class Particle:
	var p_pos: Vector2
	var p_radius: float
	var p_lifetime: float
	
	func _init(param1, param2, param3):
		p_pos = param1
		p_radius = param2
		p_lifetime = param3
		

class ParticleSystem:
	var particles: Array[Particle]
	
	func add_particle(p: Particle):
		particles.append(p)
	
	func get_size() -> int:
		return particles.size()
	
	func update_particle_system():
		for n in particles.size():
			if(particles[n].p_lifetime <= 0):
				particles.remove_at(n)


func _ready():
	shader = _2d_particles_cpu.get_active_material(0)
	particle_system = ParticleSystem.new()
	timer.start()


func _process(delta):
	var array_to_shader: Array[float]
	for n in particle_system.get_size():
		particle_system.particles[n].p_lifetime -= 0.01
		particle_system.particles[n].p_pos.y += 0.001
		array_to_shader.append(particle_system.particles[n].p_pos.x)
		array_to_shader.append(particle_system.particles[n].p_pos.y)
		array_to_shader.append(particle_system.particles[n].p_radius)
		array_to_shader.append(particle_system.particles[n].p_lifetime)
	shader.set_shader_parameter("array", array_to_shader);
	particle_system.update_particle_system()
	#array_to_shader.clear()


func _on_timer_timeout():
	var p = Particle.new(source, 0.01,  1)
	particle_system.add_particle(p)
	
