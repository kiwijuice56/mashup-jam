class_name Thermometer extends TextureRect

@export var player: Player

var frame: int = 0
var temp: float = 0.5

func _process(delta: float) -> void:
	frame += 1
	if frame % 60 == 0:
		temp = randf_range(0, 1)
	else:
		temp += randf_range(-0.1, 0.1)
	var position_new: float = -5 + 75 * (1.0 - temp)
	%Arrow.position.y = lerp(%Arrow.position.y, position_new, delta * 3)
