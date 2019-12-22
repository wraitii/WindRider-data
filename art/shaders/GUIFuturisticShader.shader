shader_type canvas_item;

// TODO: manage to get a good looking sci-fi-like-interface shader.

void fragment()
{
	vec4 c = texture(TEXTURE, UV + vec2(-1.0, 1.0) * mod(TIME / 6.0f, 18f));
	c = c * texture(TEXTURE, UV + vec2(2.0, -4.0) * mod(TIME / 10.0f - 1.4f, 8.6f));
	c = c * vec4(0.2, 0.4, 1.0, 1.0) * 3.0;
	COLOR = texture(TEXTURE, UV) * c;
	COLOR.a = c.r * 4.0;
}