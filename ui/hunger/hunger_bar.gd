class_name HungerBar extends TextureProgressBar

@export var player: Player

func _ready() -> void:
	player.hunger_changed.connect(_on_hunger_changed)

func _on_hunger_changed(new_hunger: float) -> void:
	value = new_hunger
