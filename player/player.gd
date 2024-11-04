class_name Player extends FirstPersonController

signal hunger_changed(new_hunger)

@export var hunger: float = 1.0:
	set(val):
		hunger = val
		hunger_changed.emit(hunger)

func _process(delta: float) -> void:
	super._process(delta)
	hunger -= delta * 1.0 / 64.0
