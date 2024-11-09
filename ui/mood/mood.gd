class_name Mood extends TextureRect

@export var faces: Array[CompressedTexture2D]
@export var min_time: float = 1.0
@export var max_time: float = 16.0

var idx: int = 0

func _ready() -> void:
	%Timer.timeout.connect(_on_timeout)
	%Timer.start(randf_range(min_time, max_time))

func _on_timeout() -> void:
	var old_idx: int = idx
	while idx == old_idx:
		idx = randi() % len(faces)
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(self, "scale:x", 0.0, 0.5)
	await tween.finished
	texture = faces[idx]
	tween = get_tree().create_tween()
	tween.tween_property(self, "scale:x", 0.3, 0.5)
	await tween.finished
	%Timer.start(randf_range(min_time, max_time))
