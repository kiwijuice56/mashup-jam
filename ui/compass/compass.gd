class_name Compass extends TextureRect

@export var player: Player
@export var glagglers: Node3D

func _process(delta: float) -> void:
	var angle: float = Vector3(0, 0, 1).signed_angle_to(player.get_node("%Head").transform.basis.z, Vector3(0, 1, 0)) + randf_range(-0.05, 0.05)
	%Needle.rotation = lerp_angle(%Needle.rotation, angle, delta * 8)
	var count: int = glagglers.get_child_count()
	
	for i in range(1, 1 + count):
		var dis: Vector3 = glagglers.get_child(i - 1).global_position - player.global_position
		dis.y = 0
		var angle2: float = dis.normalized().signed_angle_to(player.get_node("%Head").transform.basis.z, Vector3(0, 1, 0))
		get_child(i).rotation = angle2 + PI / 2
	
	for child in get_children():
		child.visible = true
	for i in range(count + 1, get_child_count()):
		get_child(i).visible = false
