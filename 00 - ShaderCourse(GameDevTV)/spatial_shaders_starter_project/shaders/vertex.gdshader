shader_type spatial;

void vertex() {
	VERTEX.x += sin(TIME * 5.0f + VERTEX.y * 10.0f) * .1f;
}