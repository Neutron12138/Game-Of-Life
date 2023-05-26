extends Control

func _unhandled_input(event):
	if event.is_action_pressed("escape"):
		get_tree().change_scene_to_file("res://sources/interface/StartMenu.tscn")
