shader_type spatial;
render_mode diffuse_toon, specular_toon;

group_uniforms PBR;
uniform vec3 base_color : source_color = vec3(1.0f);
group_uniforms; 

void fragment() {
	ALBEDO = base_color;
	METALLIC = 0.31f;
	ROUGHNESS = 0.067f;
}