extends Camera3D


@export var player_character: CharacterBody3D
@export var turret_pivot: Node3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# gets mouse 2D position
	var mouse_pos = get_viewport().get_mouse_position()
	
	# does ray cast to calculate 3D position
	var ray_length = 1000
	var from = project_ray_origin(mouse_pos)
	var to = from + project_ray_normal(mouse_pos) * ray_length
	var space = get_world_3d().direct_space_state
	var ray_query = PhysicsRayQueryParameters3D.new()
	ray_query.from = from
	ray_query.to = to
	var raycast_result = space.intersect_ray(ray_query)
	
	# send result to scripts needing mouse 3D position
	player_character._turret_rotation(raycast_result)
	turret_pivot.mouse_pos = raycast_result["position"]
