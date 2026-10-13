extends Node3D

# node variables
@export var barrel: MeshInstance3D
@export var player: CharacterBody3D

# mouse position variable
var mouse_pos: Vector3

# bullet shooting variables
var bullet = preload("res://bullet.tscn")
@export var base_bullet_timer: float
var bullet_timer: float = 0
var can_shoot: bool = true

func _process(delta: float, scene = self) -> void:
	# if the player can shoot
	if Input.is_action_just_pressed("shoot") && can_shoot == true:
		# prevent multiple shots rapidly
		can_shoot = false
		
		# spawns bullet
		var bullet_instance = bullet.instantiate()
		scene.get_tree().root.add_child.call_deferred(bullet_instance)
		
		# sets bullet position and mouse position adjusted from the player current position
		bullet_instance.position = Vector3 (barrel.global_transform.origin.x, 1, barrel.global_transform.origin.z)
		bullet_instance.mouse_pos = mouse_pos - player.position
		pass
		
	# timer for when player can't shoot
	elif can_shoot == false:
		bullet_timer -= delta
		if bullet_timer <= 0:
			# reset timer and enables player to shoot
			can_shoot = true
			bullet_timer = base_bullet_timer
	
	pass
