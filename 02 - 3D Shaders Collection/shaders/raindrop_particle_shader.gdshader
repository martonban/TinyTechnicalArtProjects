shader_type spatial;

uniform float[1200] array;
uniform int size;

float sdCircle(vec2 uv, vec2 offset, float radius ) {	
	float x = uv.x - offset.x;
  	float y = uv.y - offset.y;
	return length(vec2(x, y)) - radius;
}


vec4 draw_shader(vec2 uv) {
	vec4 final_color = vec4(0.0f);
	
	for(int i = 0; i < size; i+=4) {
		vec4 color_buffer;
		if(sdCircle(uv, vec2(array[i], array[i+1]), array[i+2]) <= 0.0f) {
			color_buffer = vec4(0.0f, 0.0f, 1.0f, array[i+3]);
		} else {
			color_buffer = vec4(0.0f, 0.0f, 0.0f, 0.0f);
		}
		final_color = mix(color_buffer, final_color, 0.5);
	}
	return final_color;
}


void fragment() {
	ALBEDO = draw_shader(UV).rgb;
	ALPHA = draw_shader(UV).a;
}

