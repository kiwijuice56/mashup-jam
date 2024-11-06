class_name Item extends Area3D

@export var chance: float = 0.6

func _ready() -> void:
	%PlayerRadiusArea.body_entered.connect(_on_player_entered)

func _process(delta: float) -> void:
	show_circle()

func _on_player_entered(body: PhysicsBody3D) -> void:
	if not %VisibleOnScreenNotifier3D.is_on_screen() or randf() >= chance:
		return
	%BonusAnimationPlayer.play("circle")

func show_circle() -> void:
	%Circle.position = get_viewport().get_camera_3d().unproject_position(global_transform.origin)
	
