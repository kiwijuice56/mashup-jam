class_name Compass extends TextureRect

@export var player: Player

func _process(delta: float) -> void:
	var angle: float = Vector3(0, 0, 1).signed_angle_to(player.get_node("%Head").transform.basis.z, Vector3(0, 1, 0)) + randf_range(-0.05, 0.05)
	%Needle.rotation = lerp_angle(%Needle.rotation, angle, delta * 8)
