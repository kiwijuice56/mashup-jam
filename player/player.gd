class_name Player extends FirstPersonController

signal hunger_changed(new_hunger)

@export var hunger: float = 1.0:
	set(val):
		hunger = val
		hunger_changed.emit(hunger)
@export var range: float = 64.0
@export var teleport_min: float = 3.0
@export var teleport_max: float = 6.0

var drugged: bool = false

func _ready() -> void:
	super._ready()
	%CollectBubble.area_entered.connect(_on_collect_area_entered)
	%TeleportTimer.timeout.connect(_on_teleport)
	%TeleportTimer.start(randf_range(teleport_min, teleport_max))

func _process(delta: float) -> void:
	super._process(delta)
	hunger -= delta * 1.0 / 128.0
	
	if drugged:
		AudioServer.get_bus_effect(0, 0).drive = lerp(AudioServer.get_bus_effect(0, 0).drive, 0.6, delta * 3)
		GlobalVariables.datamosh = 1.0
		GlobalVariables.refresh_frame = false
	else:
		AudioServer.get_bus_effect(0, 0).drive = lerp(AudioServer.get_bus_effect(0, 0).drive, 0.0, delta * 3)
		GlobalVariables.datamosh = lerp(GlobalVariables.datamosh, 0.0, delta * 3)
		if is_zero_approx(GlobalVariables.datamosh):
			GlobalVariables.datamosh = 0.0
		GlobalVariables.refresh_frame = true

func _on_collect_area_entered(area: Area3D) -> void:
	if area is not Item:
		return
	if (area as Item).collected:
		return
	(area as Item).collect(self)

func _on_teleport() -> void:
	teleport()
	%TeleportTimer.start(randf_range(teleport_min, teleport_max))

func teleport() -> void:
	drugged = true
	await get_tree().create_timer(randf_range(2.0, teleport_min)).timeout
	drugged = false
