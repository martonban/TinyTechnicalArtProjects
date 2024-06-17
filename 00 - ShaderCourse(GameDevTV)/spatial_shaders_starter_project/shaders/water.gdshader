shader_type spatial;

uniform sampler2D normal_map_texture : repeat_enable, filter_linear;
uniform sampler2D normal_map_texture2 : repeat_enable, filter_linear;
uniform vec3 albedo: source_color = vec3(1.0f);

uniform vec2 direction1 = vec2(1.0f, 0.0f);
uniform vec2 direction2 = vec2(1.0f, 0.0f);

uniform float scroll_speed1: hint_range(0.0f, 1.0f) = .1f;
uniform float scroll_speed2: hint_range(0.0f, 1.0f) = .1f;

void fragment() {
	
	vec2 offfset1 = scroll_speed1 * direction1 * TIME;
	vec2 offfset2 = scroll_speed2 * direction2 * TIME;
	
	vec3 normal = texture(normal_map_texture, UV + offfset1).rgb;
	vec3 normal2 = texture(normal_map_texture2, UV + offfset2).rgb;
	vec3 final_normal = mix(normal, normal2, 0.5);
	
	NORMAL_MAP = final_normal;

	ALBEDO = albedo;
	METALLIC = 0.0f;
	ROUGHNESS = 0.01f;

}