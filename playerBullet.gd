extends Node3D

# gets self
@export var bullet: Node3D

# movement variables
var mouse_pos: Vector3
var bullet_movement: Vector3
@export var bullet_speed: float
@export var bullet_lifespan: float

# damage variable
@export var bullet_damage: float

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# timer for bullet death and moves/rotates the bullet based on player velocity/mouse position at moment of shot
	if bullet_lifespan > 0:
		bullet_lifespan -= delta
		bullet_movement = Vector3(mouse_pos.x * bullet_speed * delta, 0, mouse_pos.z * bullet_speed * delta)
		bullet.position += bullet_movement
		look_at(global_position + bullet_movement)
	else:
		_bullet_death()


# destroy bullet when called
func _bullet_death():
	queue_free()
