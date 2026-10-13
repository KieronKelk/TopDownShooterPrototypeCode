extends CharacterBody3D


# variables defining the player and movement
var can_player_move: bool = true
@export var player_move_speed: float
var player_movement_input: Vector3 = Vector3.ZERO
var player_velocity: Vector3 = Vector3.ZERO

# node for the tank body pivot
@export var tank_body_pivot: Node3D

# node for turret rotaion
@export var turret_pivot: Node3D
@export var camera: Camera3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# if player can move, trigger player movement function
	if can_player_move == true:
		_player_movement(delta)
	pass

# moves the player
func _player_movement(delta: float):
	
	# gets the player inputs
	if Input.is_action_pressed("move_right"):
		player_movement_input.x = 1
	elif Input.is_action_pressed("move_left"):
		player_movement_input.x = -1
	else:
		player_movement_input.x = 0
	
	if Input.is_action_pressed("move_up"):
		player_movement_input.z = -1
	elif Input.is_action_pressed("move_down"):
		player_movement_input.z = 1
	else:
		player_movement_input.z = 0
	
	# calculates player velocity and moves the player accordingly
	player_velocity = Vector3(player_movement_input.x * player_move_speed *delta, 0, player_movement_input.z * player_move_speed * delta)
	velocity = player_velocity
	move_and_slide()
	
	# tank body looks at player movement direction
	if player_velocity != Vector3.ZERO:
		tank_body_pivot.look_at(global_position + player_velocity * 2, Vector3.UP)

# rotates turret to mouse position
func _turret_rotation(turret_look_towards):
	
	var look_towards = turret_look_towards["position"]
	
	# sets Y to 1, to prevent turret rotating weirdly
	if look_towards.y != 1:
		look_towards.y = 1
	
	# rotates turret to look towards mouse position
	turret_pivot.look_at(look_towards, Vector3.UP)
	
	# stops rotation on X and Z to prevent turret rotating weirdly
	turret_pivot.rotation.x = 0.0
	turret_pivot.rotation.z = 0.0
	pass

# when the player dies
func _player_death():
	# changes scene to the main menu
	get_tree().change_scene_to_file("res://mainMenu.tscn")
	pass
