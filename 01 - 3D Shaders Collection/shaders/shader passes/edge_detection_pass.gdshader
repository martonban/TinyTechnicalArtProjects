/*
	This is a simple Difference of Gaussians edge detection shader
	using Gaussians blur
*/
shader_type spatial;

uniform sampler2D input_albedo;
uniform vec2 input_resolution = vec2(4096, 4096);

vec3 gaussianBlur(float guassionDivisiorl, float r, vec2 uv) {
	vec2 img_res = input_resolution / r;
	vec2 texelSize = 1.0 / img_res;
	
	vec3 result_color = vec3(0.0f);
	result_color += texture(input_albedo, uv + vec2(-1.0, 1.0) * texelSize).rgb * 1.0;
	result_color += texture(input_albedo, uv + vec2(0.0, 1.0) * texelSize).rgb * 2.0;
  	result_color += texture(input_albedo, uv + vec2(1.0, 1.0) * texelSize).rgb * 1.0;
  	result_color += texture(input_albedo, uv + vec2(-1.0, 0.0) * texelSize).rgb * 2.0;
  	result_color += texture(input_albedo, uv + vec2(0.0, 0.0) * texelSize).rgb * 4.0;
  	result_color += texture(input_albedo, uv + vec2(1.0, 0.0) * texelSize).rgb * 2.0;
  	result_color += texture(input_albedo, uv + vec2(-1, -1) * texelSize).rgb * 1.0;
  	result_color += texture(input_albedo, uv + vec2(0, -1) * texelSize).rgb * 2.0;
  	result_color += texture(input_albedo, uv + vec2(1, -1) * texelSize).rgb * 1.0;
	
	return result_color / guassionDivisiorl;
}

void fragment() {
	
	vec3 color_base  = texture(input_albedo, UV).rgb;
	
	vec3 blur_pass_1 = gaussianBlur(16, 1, UV);
	vec3 blur_pass_2 = gaussianBlur(16, 20, UV);
	
	vec3 color = blur_pass_1 - blur_pass_2;
	
	

	
	ALBEDO = color;
}
