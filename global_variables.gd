extends Node

@export var sanity: float = 0.5: 
	set(val):
		for node in get_tree().get_nodes_in_group("Sanity"):
			if node is ColorRect:
				node.material.set_shader_parameter("sanity", val)
		
		sanity = val
