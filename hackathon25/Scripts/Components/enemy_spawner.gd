extends Node2D

@export var enemy : PackedScene
@export var spawnDelay := 5.0

func _ready() -> void:
	spawn()
	$ProgressBar.hide()
func spawn():
	var e = enemy.instantiate()
	get_tree().root.add_child(e)
	e.position = $Marker2D.global_position
	await get_tree().create_timer(spawnDelay).timeout
	spawn()
