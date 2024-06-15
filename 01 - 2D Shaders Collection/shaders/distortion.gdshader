shader_type canvas_item;

uniform sampler2D screen_tex: hint_screen_texture, filter_nearest;

// It's important to have repeat_enable!!
uniform sampler2D noise_tex_1: repeat_enable;
uniform sampler2D noise_tex_2: repeat_enable;

uniform vec2 offset1 = vec2(0.1);
uniform vec2 offset2 = vec2(0.2);

uniform float distortaion_strength: hint_range(-1.0, 1.0) = 0.02f;

void fragment() {
	vec4 noise_color = texture(noise_tex_1, UV + offset1 * TIME);
	vec4 noise_color2 = texture(noise_tex_2, UV + offset2 * TIME);
	
	// Create one noise from the two 
	float final_noise = noise_color.r * noise_color2.r * distortaion_strength;
	vec4 final_color = texture(screen_tex, SCREEN_UV + final_noise);
	
	COLOR = final_color;
}