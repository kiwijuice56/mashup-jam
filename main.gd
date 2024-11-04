class_name Main extends Node

func _process(delta: float) -> void:
	GlobalVariables.sanity = 0.3
	if Input.is_action_pressed("crouch"):
		AudioServer.get_bus_effect(0, 0).drive = lerp(AudioServer.get_bus_effect(0, 0).drive, 0.75, delta * 3)
		GlobalVariables.datamosh = lerp(GlobalVariables.datamosh, 1.1, delta * 3)
		GlobalVariables.refresh_frame = false
	else:
		AudioServer.get_bus_effect(0, 0).drive = lerp(AudioServer.get_bus_effect(0, 0).drive, 0.0, delta * 3)
		GlobalVariables.datamosh = lerp(GlobalVariables.datamosh, 0.0, delta * 3)
		if is_zero_approx(GlobalVariables.datamosh):
			GlobalVariables.datamosh = 0.0
		GlobalVariables.refresh_frame = true
