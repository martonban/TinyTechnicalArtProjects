shader_type canvas_item;

void vertex() {
	// This is a Vector2, if you want to manipulate 
	// every vertex at the shader you need to use this 
	// so this varriable is going to be different every time
	if(VERTEX.y < 0.5) {
		VERTEX += vec2(10.f, 0.0f)*cos(TIME);
	}
	
}

void fragment() {
	// Called for every pixel the material is visible on.
}
