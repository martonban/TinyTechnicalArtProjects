shader_type canvas_item;

uniform sampler2D maks_tex;

void fragment() {
	vec4 original_color = texture(TEXTURE, UV);
	vec4 mask_color = texture(maks_tex, UV + vec2(0.0f, -.05f));
	
	if(mask_color.r > 0.0f) {
		COLOR.a = 0.0f;
	}
}
