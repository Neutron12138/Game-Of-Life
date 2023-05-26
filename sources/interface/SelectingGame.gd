extends Control

const SAVES_PATH = "user://saves/"

# 当前选择的索引，-1为未选择
var _selected : int = -1

func _ready():
	# 判断存档目录是否存在
	if not DirAccess.dir_exists_absolute(SAVES_PATH):
		# 不存在则创建
		DirAccess.make_dir_absolute(SAVES_PATH)
	
	# 遍历存档目录并添加到列表
	var dir = DirAccess.open(SAVES_PATH)
	var files = dir.get_files()
	for file in files:
		$VBoxContainer/game_list.add_item(file)


func _unhandled_input(event) -> void:
	if event.is_action_pressed("escape"):
		get_tree().change_scene_to_file("res://sources/interface/StartMenu.tscn")


func _on_game_list_item_selected(index):
	_selected = index
	$VBoxContainer/HBoxContainer/delete.disabled = false


func _on_game_list_item_activated(index):
	get_tree().change_scene_to_file("res://sources/interface/Gaming.tscn")


func _on_new_pressed():
	$VBoxContainer/game_list.add_item(str(Time.get_unix_time_from_system()))


func _on_delete_pressed():
	if _selected != -1:
		$VBoxContainer/game_list.remove_item(_selected)
		_selected = -1
		$VBoxContainer/HBoxContainer/delete.disabled = true
