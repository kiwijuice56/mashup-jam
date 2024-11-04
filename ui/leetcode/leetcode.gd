class_name Leetcode extends TextureRect

func _unhandled_input(_event: InputEvent) -> void:
	for i in range(26):
		if Input.is_physical_key_pressed(65 + i):
			%Code.text += "abcdefghijklmnopqrstuvwxyz"[i]
