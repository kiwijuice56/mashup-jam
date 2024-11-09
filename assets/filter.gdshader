shader_type canvas_item;

uniform sampler2D noise2: source_color, repeat_enable;
uniform sampler2D SCREEN_TEXTURE: hint_screen_texture, repeat_enable, filter_linear_mipmap;

uniform float sanity = 0.5;

void fragment() {
	highp float x = mod(texture(noise2, SCREEN_UV + 0.1*cos(vec2(0.5 * TIME * (1.0 - sanity)))).r + TIME, 1.0);
	highp vec2 snapped = UV + x * mod(UV, SCREEN_PIXEL_SIZE * 12.0);
	vec4 anger = (textureLod(SCREEN_TEXTURE, snapped, 0.0) + textureLod(SCREEN_TEXTURE, SCREEN_UV, 0.0)) / 2.0;
	COLOR = texture(SCREEN_TEXTURE, SCREEN_UV) * sanity + (1.0 - sanity) * anger;
}