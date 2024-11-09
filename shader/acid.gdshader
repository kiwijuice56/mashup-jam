shader_type spatial;
render_mode depth_prepass_alpha;

uniform float sanity = 0.5;
uniform sampler2D building_texture: source_color;
uniform sampler2D noise_texture: source_color;
uniform sampler2D screen_texture: source_color, hint_screen_texture;
uniform float speed = 0.5;

void fragment() {
	vec3 col = 0.001*VERTEX.x + texture(noise_texture, UV).rgb * 0.1 + texture(noise_texture, SCREEN_UV).rgb * 0.05 + 0.5 * texture(screen_texture, UV).rgb;
	vec2 z = vec2(0., 0.);
	vec2 co = mod(vec2(col.x, 0.3+ 0.2*col.y) * 2.0, 1.0);
	
	bool fractal = false;
	
	for (int i = 0; i < 32; i ++){
		z = vec2(z.x*z.x - z.y*z.y + co.x, 2.0 * z.x * z.y + co.y);
		if (z.x * z.x + z.y * z.y > 50.0){
			fractal = true;
	    }
	}
	if (fractal) {
	    col = col * 0.5;
	}

	col = cos((col.xyz + vec3(0.3 + 0.1*TIME*speed, 0.7 + 0.02*TIME*speed, 1.5 + 0.1 * TIME*speed)) * 100.) * 0.5 + 0.5;
	col = floor(col * 5.0) / 5.0;
	ALBEDO = texture(building_texture, UV).rgb * sanity + (1.0 - sanity) * col;
}

