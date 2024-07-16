shader_type spatial;

uniform sampler2D color_texture;
uniform sampler2D normal_texture;
uniform sampler2D rough_texture;
uniform sampler2D ao_map;
uniform sampler2D arm_map;


void fragment() {
	vec2 UV_adjust = UV * 10.f;
	vec4 final_color = texture(color_texture, UV_adjust);
	vec4 final_normal = texture(normal_texture, UV_adjust);
	vec4 final_rough = texture(rough_texture, UV_adjust);
	vec4 final_ao = texture(ao_map, UV_adjust);
	float metalic = texture(arm_map, UV_adjust).b;
	ALBEDO = final_color.rgb;
	NORMAL_MAP = final_normal.rgb;
	ROUGHNESS = final_rough.r;
	AO = final_ao.r;
	METALLIC = metalic;
}

