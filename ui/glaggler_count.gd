class_name GlagglerCount extends Label

func _ready() -> void:
	GlobalVariables.glagglers_changed.connect(_on_glagglers_changed)

func _on_glagglers_changed() -> void:
	text = "%d/8" % GlobalVariables.glagglers 
