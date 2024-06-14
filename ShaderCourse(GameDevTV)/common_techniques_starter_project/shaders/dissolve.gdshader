shader_type canvas_item;

uniform sampler2D noise_tex;

void fragment() {
	float dissolve_pct = sin(TIME * 2.0f);
	vec4 original_color = texture(TEXTURE, UV);
	vec4 final_color = original_color;
	vec4 noise = texture(noise_tex, UV);
	
	
	if(dissolve_pct >= noise.r) {
		final_color.a = 0.0f;
	}
	
	COLOR = final_color;
}

