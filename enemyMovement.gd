extends Node3D

@export var enemy_movement_speed: float
@export var enemy: Node3D
@export var player: CharacterBody3D
var player_position: Vector3

func _ready() -> void:
	add_to_group("Enemy")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# gets player position
	if player != null:
		player_position = player.global_position
	
		# enemy move towards player
		enemy.position = enemy.position.move_toward(player_position, (enemy_movement_speed * delta))
	
		# enemy look toward movement position
		look_at(player_position)
		enemy.rotation.x = 0.0
		enemy.rotation.z = 0.0
	
	# if no player, then destroy's itself
	else:
		queue_free()
	pass
