/*
	This is a simple Difference of Gaussians edge detection shader
	using Gaussians blur
*/
shader_type spatial;

uniform sampler2D input_albedo;

uniform float lod: hint_range(0.0, 5) = 0.0;

void fragment() {
	
	vec4 color  = texture(input_albedo, UV);
			
	ALBEDO = color.rgb;
}
