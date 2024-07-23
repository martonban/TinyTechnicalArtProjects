shader_type spatial;

uniform sampler2D noise1_texture;
uniform sampler2D noise2_texture;

void fragment() {
	vec4 normal_1 = texture(noise1_texture, UV * 10.f);
	vec4 normal_2 = texture(noise2_texture, UV * 10.f);
	
	vec4 final_normal = mix(normal_1, normal_2, 0.5);
	
	NORMAL_MAP = final_normal.rgb;
	ALBEDO = vec3(0.0f, 1.0f, 0.0f);
	METALLIC = 100.f;
	ROUGHNESS = 0.0f;
}

