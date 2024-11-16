extends Node

signal glagglers_changed

var sanity: float = 1.0: 
	set(val):
		for node in get_tree().get_nodes_in_group("Sanity"):
			if node is ColorRect:
				node.material.set_shader_parameter("sanity", val)
			if node is MeshInstance3D:
				node.get("surface_material_override/0").set("shader_parameter/sanity", val)
		
		sanity = val

var glagglers: int = 0:
	set(val):
		glagglers = val
		glagglers_changed.emit()

var datamosh: float = 0.5
var refresh_frame: bool = true
