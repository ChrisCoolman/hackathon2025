extends CanvasLayer

func resume():
	hide()
	get_tree().paused = false
	
func pause():
	show()
	get_tree().paused = true
	
func testEsc():
	if Input.is_action_just_pressed("escape") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("escape") and get_tree().paused == true:
		resume()

func _on_resume_pressed() -> void:
	resume()

func _on_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()

func _on_main_menu_pressed() -> void:
	resume()
	get_tree().change_scene_to_file("res://Scenes/User Interface/main_menu.tscn")

func _process(delta: float) -> void:
	testEsc()

func _ready() -> void:
	hide()
