shader_type canvas_item;

uniform float tile_factor = 10.0f;
uniform float aspect_ratio = 0.5f;

void fragment() {
	vec2 texture_based_offset = vec2(0.0);
	
	vec2 adjust_uv = UV * tile_factor;
	adjust_uv.y *= aspect_ratio;
	
	COLOR = texture(TEXTURE, adjust_uv + texture_based_offset);
}