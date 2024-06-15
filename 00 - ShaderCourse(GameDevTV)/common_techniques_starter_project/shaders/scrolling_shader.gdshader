shader_type canvas_item;
// At this shader we want to thing
// Tile it: manipulate the UV's
// Animating it with an offset

uniform vec2 tiling = vec2(1.0f, 1.0f);

group_uniforms AnimationSetting;
uniform float speed = 1.0f;
uniform vec2 offset = vec2(0.0f);
group_uniforms;

void vertex() {
	UV *= tiling;
	UV += TIME * offset * speed;
}

