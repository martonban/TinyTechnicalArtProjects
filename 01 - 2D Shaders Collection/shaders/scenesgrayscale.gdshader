shader_type canvas_item;

void fragment () {
	vec4 original_color = texture(TEXTURE, UV);
	float grayscale = (original_color.r + original_color.g + original_color.b) / 3.0f;
	
	COLOR = vec4(vec3(grayscale), original_color.a);
}
