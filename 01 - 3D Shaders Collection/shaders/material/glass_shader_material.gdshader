shader_type spatial;

group_uniforms shader_params;
	uniform float darkener : hint_range(0.0, 0.05, 0.001);
group_uniforms;

group_uniforms textures;
	uniform sampler2D noise_texture;
	uniform sampler2D grey_scalle_texture;
	uniform sampler2D screen_texture: hint_screen_texture, filter_nearest;
group_uniforms;


void fragment() {
	// Textures Sampeling
	vec4 noise_1 = texture(noise_texture, UV);
	vec4 grey_scalle = texture(grey_scalle_texture, UV);
	
	// Data Manipulations
	
	vec3 normal = noise_1.rgb;
	float distortion = mix(0.0f, 0.003f, grey_scalle.r);
	vec2 final_dis = vec2(distortion);
	
	vec3 final_albedo = texture(screen_texture, SCREEN_UV + 0.003).rgb - darkener;
	
	// Final Results
	ALBEDO = final_albedo;
	METALLIC = 0.0f;
}

