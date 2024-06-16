shader_type spatial;

uniform vec3 sphere_color: source_color = vec3(1.0f);

void fragment() {
	ALBEDO = sphere_color;
	ALPHA = 1.f;
}
