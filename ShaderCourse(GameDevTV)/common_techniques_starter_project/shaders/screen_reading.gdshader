shader_type canvas_item;

uniform sampler2D screen_texture: hint_screen_texture, filter_nearest;

void fragment() {
	vec4 screen_color = texture(screen_texture, SCREEN_UV);
	float gray_value = (screen_color.r + screen_color.g + screen_color.b) / 3.0f;
	COLOR = vec4( vec3(gray_value), screen_color.a);
}

