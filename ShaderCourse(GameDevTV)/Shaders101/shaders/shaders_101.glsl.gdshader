shader_type canvas_item;

// These are the basic parameters
// We can grop them 
group_uniforms BasicGroup;
uniform float amplitude = 10.0f;
uniform float speed = 1;
uniform bool isJiggle = true;
uniform vec4 vector4;
group_uniforms;

group_uniforms AdvancedGroup;
// These are the uniform hints. aka better dev experiance for the devs
uniform float range_example: hint_range(1.0f, 10.0f) = 1.0f;
uniform vec4 color_example: source_color;
group_uniforms;


void vertex() {
	// This is a Vector2, if you want to manipulate 
	// every vertex at the shader you need to use this 
	// so this varriable is going to be different every time
	if(VERTEX.y < 0.5) {
		VERTEX += vec2(cos(TIME * speed), 0.f) * amplitude;
	}
	
}

void fragment() {
	COLOR = texture(TEXTURE, UV) * color_example;
}