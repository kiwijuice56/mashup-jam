class_name Thermometer extends TextureRect

@export var player: Player

func _process(delta: float) -> void:
	var speed_range: float = randf_range(0, 1)
	var position_new: float = -5 + 75 * (1.0 - speed_range)
	%Arrow.position.y = lerp(%Arrow.position.y, position_new, delta * 3)
