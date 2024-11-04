class_name Chunk extends GridMap

@export var chunk_size: int = 8
@export var noise: NoiseTexture2D

func _ready() -> void:
	await noise.changed
	generate(Vector3())

func generate(coordinate: Vector3) -> void:
	position = coordinate
	for i in range(chunk_size):
		for j in range(chunk_size):
			var uv: Vector2 = Vector2(coordinate.x + i, coordinate.y + j).posmod(512) / 512.0
			var height: int = int(noise.get_image().get_pixel(min(uv.x * noise.get_width(), noise.get_width() - 1), min(uv.y * noise.get_height(), noise.get_height() - 1)).r*8) 
			for k in range(height):
				set_cell_item(Vector3i(i, k, j), 0)
