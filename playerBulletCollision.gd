extends RigidBody3D

# root node for bullet
@export var bullet: Node3D

# bullet collides with another node
func _on_body_entered(body:Node3D):
	
	# actions based on what group the bullet hits
	if body.is_in_group("Wall"):
		# destroy itself if hit wall
		bullet.queue_free()
	elif body.is_in_group("Enemy"):
		# destroy the enemy and self
		var enemy = body.enemy
		enemy.queue_free()
		bullet.queue_free()
		pass
