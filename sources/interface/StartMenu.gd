extends Control

func _unhandled_input(event) -> void:
	if event.is_action_pressed("escape"):
		get_tree().quit()

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://sources/interface/SelectingGame.tscn")

func _on_rules_pressed() -> void:
	get_tree().change_scene_to_file("res://sources/interface/SelectingRules.tscn")

func _on_about_pressed() -> void:
	get_tree().change_scene_to_file("res://sources/interface/About.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()

