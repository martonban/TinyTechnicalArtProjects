shader_type spatial;
 
group_uniforms Basic_Settings;
	uniform float rougness: hint_range(0.0, 1.0, 0.1);
	uniform float specular: hint_range(0.0, 1.0, 0.1);
	uniform float ambient_occlusion: hint_range(0.0, 1.0, 0.1);
group_uniforms;

group_uniforms Base_Color;
	uniform sampler2D base_color_noise: repeat_enable, filter_linear;
group_uniforms;

group_uniforms Rock_Settings;
group_uniforms;


void fragment() {
	
	
	
	vec3 final_color = texture(base_color_noise, UV).rgb;
	
	// Base Texture
	ALBEDO = final_color;
	ROUGHNESS = rougness;
	SPECULAR = specular;
	AO = ambient_occlusion;
}

