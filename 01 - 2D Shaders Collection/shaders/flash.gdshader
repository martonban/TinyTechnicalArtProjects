shader_type canvas_item;

uniform vec4 flash_color : source_color = vec4(1.0);
uniform float flash_pct : hint_range(0.0f, 1.0f) = 0.0f;

void fragment() {
	vec4 origial_color = texture(TEXTURE, UV);
	COLOR = mix(origial_color, flash_color, flash_pct);
	COLOR.a *= origial_color.a;
}