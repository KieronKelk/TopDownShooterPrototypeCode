extends Node

@export var player: CharacterBody3D
@export var base_spawn_time: float
var spawn_time: float
var enemy_type = [preload("res://enemy.tscn"), preload("res://fastEnemy.tscn")]  # enemy types to spawn
@export var can_spawn_enemy: bool
@export var spawn_normal_chance: float

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float, scene = self) -> void:
	# if enemies can be spawned and the player exists
	if can_spawn_enemy == true and player != null:
		
		# timer for enemy spawn
		spawn_time -= delta
		if spawn_time <= 0:
			
			# reduce timer delay and chance of normal enemies spawning
			spawn_time = base_spawn_time
			base_spawn_time -= delta
			spawn_normal_chance -= 0.5
			
			# gets type of enemy to spawn by chance
			var i = randf_range(0, 100)
			if i < spawn_normal_chance:
				i = 0
			else :
				i = randf_range(1, enemy_type.size() - 1)
			
			# spawns enemy
			var enemy_instance = enemy_type[i].instantiate()
			scene.get_tree().root.add_child.call_deferred(enemy_instance)
			
			# sets enemy position, ensuring it doesn't spawn to close to player
			var enemy_spawn_position = Vector3(randf_range(-19, 19), 0, randf_range( -19, 19))
			while (player.position.x - enemy_spawn_position.x) < 2 and (player.position.x - enemy_spawn_position.x) > -2 or (player.position.z - enemy_spawn_position.z) < 2 and (player.position.z - enemy_spawn_position.z) > -2:
				enemy_spawn_position = Vector3(randf_range(-19, 19), 1, randf_range( -19, 19))
			
			# sets enemy position and what the player is
			enemy_instance.position =  enemy_spawn_position
			enemy_instance.player = player
			pass
		pass
	pass
