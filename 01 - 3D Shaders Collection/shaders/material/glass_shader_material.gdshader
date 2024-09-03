shader_type spatial;

group_uniforms textures;
	uniform sampler2D high_frequency_noise_texture;
	uniform sampler2D low_frequency_noise_texture;
	uniform sampler2D grey_scalle_texture;
	uniform sampler2D inv_grey_scalle_texture;
	uniform sampler2D screen_texture: hint_screen_texture, filter_nearest;
group_uniforms;

void fragment() {
	// Textures Sampeling
	vec4 noise_high_freq = texture(high_frequency_noise_texture, UV);
	vec4 noise_low_freq = texture(low_frequency_noise_texture, UV);
	vec4 grey_scalle = texture(grey_scalle_texture, UV);
	vec4 inv_grey_scalle = texture(inv_grey_scalle_texture, UV);
	
	// Data Manipulations
	

	// Normal Map
	vec3 final_normal_map = mix(noise_low_freq.rgb, noise_high_freq.rgb, inv_grey_scalle.r);
	
	// ALBEDO
	vec3 screen_albedo = texture(screen_texture, SCREEN_UV + 0.003 + (final_normal_map.r/90.0f)).rgb + 0.05f;
	vec3 final_albedo = mix(screen_albedo, inv_grey_scalle.rgb, 0.05);
	
	// Final Results
	ALBEDO = final_albedo;
	NORMAL = final_normal_map;

}

