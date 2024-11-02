class_name Main extends Node

var x: int = 0

func _process(delta: float) -> void:
	x += 1
	if x % 60 == 0:
		GlobalVariables.sanity = randf()
