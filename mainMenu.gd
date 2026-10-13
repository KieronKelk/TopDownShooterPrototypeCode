extends Control

func _ready() -> void:
	# connects buttons to corresponding functions
	%Play.pressed.connect(_play)
	%Quit.pressed.connect(_Quit)

# changes scene to the game level
func _play():
	get_tree().change_scene_to_file("res://gameLevel.tscn")

# quits the game
func _Quit():
	get_tree().quit()
