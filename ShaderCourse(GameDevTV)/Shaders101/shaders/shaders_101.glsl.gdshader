shader_type canvas_item;

void vertex() {
	// This is a Vector2, if you want to manipulate 
	// every vertex at the shader you need to use this 
	// so this varriable is going to be different every time
	if(VERTEX.y < 0.5) {
		VERTEX += vec2(cos(TIME), 0.f) * 10.f;
	}
	
}

void fragment() {
	// The texture will disapear if we using start writing our own fragment shader
	// becuse we kind of overide the default shader, for this reason we need to sample 
	// by ourselfes
	
	// we can mix colors
	vec4 color = vec4(0.0f, 0.0f, 1.0f, 1.0f);
	vec4 color2 = vec4(0.0f, 0.5f, 0.0f, 1.0f);
	vec4 output_color = mix(color, color2, ((cos(TIME) + 1.f) * 0.5f));
	 
	COLOR = output_color;
}