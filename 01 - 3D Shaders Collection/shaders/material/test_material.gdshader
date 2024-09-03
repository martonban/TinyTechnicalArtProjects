shader_type spatial;

uniform sampler2D tex; 

void fragment() {
	ALBEDO = texture(tex, UV * 2.0f).rgb/5.0f;
	ALPHA = 1.0f;
}