shader_type spatial;

group_uniforms PBR;
uniform vec3 base_color : source_color = vec3(1.0f);
uniform float metalic_value: hint_range(0.0, 1.0);
uniform float roughness_value: hint_range(0.0, 1.0); 
group_uniforms; 

void fragment() {
	ALBEDO = base_color;
	METALLIC = metalic_value;
	ROUGHNESS = roughness_value;
}