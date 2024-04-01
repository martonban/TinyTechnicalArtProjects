shader_type canvas_item;

uniform float aspect_ratio = 0.5;
uniform vec2 tiled_factor = vec2(5.0, 5.0);

// Waves Controll
uniform vec2 offsetScale = vec2(2.0, 2.0);

uniform float wavesAmplitude = 0.05;

uniform float speed = 1.0f;


void fragment() {
	vec2 tiled_uvs = UV  * tiled_factor;
	tiled_uvs.y *= aspect_ratio;
	
	// Displace texture
	vec2 waves_uv_offset;
	waves_uv_offset.x = cos((TIME * speed) + (tiled_uvs.x + tiled_uvs.y) * offsetScale.x);
	waves_uv_offset.y = sin((TIME * speed) + (tiled_uvs.y + tiled_uvs.x) * offsetScale.y);
	
	// For Debugging
	//COLOR = vec4(waves_uv_offset / 0.05, 0.0f, 1.0f);
	
	COLOR = texture(TEXTURE, tiled_uvs + waves_uv_offset * wavesAmplitude);
}