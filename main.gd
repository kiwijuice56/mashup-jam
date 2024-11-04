class_name Main extends Node

func _process(delta: float) -> void:
	GlobalVariables.sanity = 0.3
	if Input.is_action_pressed("crouch"):
		GlobalVariables.datamosh = lerp(GlobalVariables.datamosh, 1.1, delta * 3)
		GlobalVariables.refresh_frame = false
	else:
		GlobalVariables.datamosh = lerp(GlobalVariables.datamosh, 0.0, delta * 3)
		if is_zero_approx(GlobalVariables.datamosh):
			GlobalVariables.datamosh = 0.0
		GlobalVariables.refresh_frame = true
