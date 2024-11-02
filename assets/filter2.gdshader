shader_type canvas_item;

uniform sampler2D noise1: source_color, repeat_enable;
uniform sampler2D noise2: source_color, repeat_enable;
uniform sampler2D SCREEN_TEXTURE: hint_screen_texture;
uniform float block_size = 32;

uniform float sanity = 0.5;

void fragment() {
	float x = mod(texture(noise2, SCREEN_UV + 0.2*sin(vec2(TIME * (1.0 - sanity)))).r + TIME, 1.0);
	vec2 snapped = SCREEN_UV + x*mod(SCREEN_UV * 3.0/4.0, 1.0 / block_size);  
	vec4 anger = (texture(SCREEN_TEXTURE, snapped) + texture(SCREEN_TEXTURE, SCREEN_UV)) / 2.0;
	COLOR = texture(SCREEN_TEXTURE, SCREEN_UV) * sanity + (1.0 - sanity) * anger;
}
