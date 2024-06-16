shader_type spatial;

uniform sampler2D base_color_texture;

void fragment() {
	vec2 adjusted_uv = UV * 6.0f;
	adjusted_uv.y += sin(adjusted_uv.x * 50.0f + TIME * 3.0f) * 0.025; 
	
	vec4 base_color_texture_color = texture(base_color_texture, adjusted_uv );
	ALBEDO = base_color_texture_color.rgb;
	ALPHA = 1.0f;
}