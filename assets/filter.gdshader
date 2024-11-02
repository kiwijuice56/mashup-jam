shader_type canvas_item;

uniform sampler2D noise1: source_color, repeat_enable;
uniform sampler2D noise2: source_color;
uniform sampler2D SCREEN_TEXTURE: hint_screen_texture;
uniform float block_size = 32;

void fragment() {
	float x = mod(texture(noise1, SCREEN_UV + 0.2*vec2(TIME)).r + TIME, SCREEN_UV.x);
	vec2 snapped = SCREEN_UV + x*mod(SCREEN_UV * 3.0/4.0, 1.0 / block_size);  
	COLOR = (texture(SCREEN_TEXTURE, snapped) + texture(SCREEN_TEXTURE, SCREEN_UV)) / 2.0;
}
