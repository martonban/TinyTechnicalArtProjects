shader_type canvas_item;

// Texture varriable
uniform sampler2D gradient_texture;

void fragment () {
	vec4 original_color = texture(TEXTURE, UV);
	float grayscale = (original_color.r + original_color.g + original_color.b) / 3.0f;
	
	vec2 sample_coords = vec2(grayscale);
	
	vec4 gradient_color = texture(gradient_texture, sample_coords);
	
	//COLOR = gradient_color;
	COLOR = vec4(gradient_color.rgb, original_color.a);
}
