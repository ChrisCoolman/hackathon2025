extends CanvasLayer



func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/game_world.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
