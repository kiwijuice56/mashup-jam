extends Node

var sanity: float = 0.5: 
	set(val):
		for node in get_tree().get_nodes_in_group("Sanity"):
			if node is ColorRect:
				node.material.set_shader_parameter("sanity", val)
		
		sanity = val

var glagglers: int = 0 

var datamosh: float = 0.5
var refresh_frame: bool = true
