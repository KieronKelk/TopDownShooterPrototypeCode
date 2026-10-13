extends RigidBody3D

@export var damage: float
@export var enemy: Node3D
const player := preload("res://player.tscn")


	# on collide
func _on_body_entered(body:Node3D):
	#check if player
	if body.is_in_group("Player"):
		# destroys player then self
		body._player_death()
		enemy.queue_free()
