extends Control

var score: int
@export var label: Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = "Score: " + str(score)
	pass
