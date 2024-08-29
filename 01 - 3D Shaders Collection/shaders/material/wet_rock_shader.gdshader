shader_type spatial;


group_uniforms Shader_Parameters;
	uniform float wet_percentage : hint_range(0.4f, 2.f ,0.01f);
	uniform float dark : hint_range(2.5, 5.0, 0.1);
group_uniforms;

group_uniforms Textures_Setting;
	uniform float UV_mapping_scaler : hint_range(0, 20, 1) = 5;
	uniform float UV_offset : hint_range(0.f, 10.f, 0.01f);
	uniform sampler2D color_texture;
	uniform sampler2D normal_texture;
	uniform sampler2D rough_texture;
	uniform sampler2D ao_map;
	uniform sampler2D arm_map;
	uniform sampler2D noise_textue;
	uniform sampler2D height_map;
group_uniforms;


void fragment() {
	// Texture Maps
	vec2 UV_adjust = UV * UV_mapping_scaler + UV_offset;
	vec4 texture_color = texture(color_texture, UV_adjust);
	vec3 texture_normal = texture(normal_texture, UV_adjust).rgb;
	vec4 texture_rough = texture(rough_texture, UV_adjust);
	vec4 texture_ao = texture(ao_map, UV_adjust);
	float texture_metalic = texture(arm_map, UV_adjust).b;
	vec3 noise_texture = texture(noise_textue, UV_adjust).rgb;
	
	// Calculate the final_values based on wet_pct
	vec3 final_normal = mix(texture_normal, noise_texture, 0.1);
	
	// grayscale of the final color d
	vec3 final_color = texture_color.rgb / dark;
	float final_roughness = texture_rough.r * noise_texture.r * wet_percentage;
	
	
	ALBEDO =  final_color;
	NORMAL_MAP = final_normal;
	ROUGHNESS = final_roughness;
	AO = texture_ao.r;
	METALLIC = texture_metalic;
}

