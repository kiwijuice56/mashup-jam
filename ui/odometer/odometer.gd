class_name Odometer extends TextureRect

@export var player: Player

func _process(delta: float) -> void:
	var speed_range: float = player.velocity.length() / 30.0 + randf_range(-0.05, 0.05)
	speed_range = clampf(speed_range, 0.0, 1.0)
	var angle: float = -130 + speed_range * 260
	angle = clampf(angle, -130, 260)
	%Arrow.rotation_degrees = lerp(%Arrow.rotation_degrees, angle, delta * 5)
