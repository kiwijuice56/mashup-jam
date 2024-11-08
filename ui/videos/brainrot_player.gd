class_name BrainrotPlayer extends VideoStreamPlayer

@export var videos: Array[VideoStreamTheora]

func _ready() -> void:
	play_video()

func play_video() -> void:
	stream = videos.pick_random()
	play()
	await finished
	play_video.call_deferred()
