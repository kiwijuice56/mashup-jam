class_name Main extends Node

func _process(delta: float) -> void:
	GlobalVariables.sanity = lerp(GlobalVariables.sanity, 0.0, delta * 0.0025)
