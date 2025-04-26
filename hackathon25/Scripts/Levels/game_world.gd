extends Node2D

@onready var point: PathFollow2D = $Path2D/PathFollow2D
@export var powerups : Array[PackedScene] = []
@export var spawners := 4

func _ready() -> void:
	print(powerups[0])
	makePowerup()
	
func makePowerup():
	var num = randf_range(0, 1)
	point.progress_ratio = num
	num = randi_range(0, len(powerups) - 1)
	var p = powerups[num].instantiate()
	get_tree().root.add_child(p)
	p.position = point.position

func _on_enemy_spawner_spawner_killed() -> void:
	spawners -= 1
	if spawners <= 0:
		get_tree().change_scene_to_file("res://Scenes/User Interface/main_menu.tscn")

func _on_enemy_spawner_2_spawner_killed() -> void:
	spawners -= 1
	if spawners <= 0:
		get_tree().change_scene_to_file("res://Scenes/User Interface/main_menu.tscn")

func _on_enemy_spawner_3_spawner_killed() -> void:
	spawners -= 1
	if spawners <= 0:
		get_tree().change_scene_to_file("res://Scenes/User Interface/main_menu.tscn")

func _on_enemy_spawner_4_spawner_killed() -> void:
	spawners -= 1
	if spawners <= 0:
		get_tree().change_scene_to_file("res://Scenes/User Interface/main_menu.tscn")
