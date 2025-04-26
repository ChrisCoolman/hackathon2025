extends Area2D
signal spawner_killed
@export var progressBar : ProgressBar
@onready var healthcomp = $HealthComponent
@export var enemyType : PackedScene
func _ready() -> void:
	progressBar.hide()
	progressBar.max_value = healthcomp.MAX_HEALTH
	spawn()

func _process(delta: float) -> void:
	progressBar.value = healthcomp.health
func kill():
	emit_signal("spawner_killed")
	queue_free()
	
func spawn():
	var enemy = enemyType.instantiate()
	get_tree().root.add_child(enemy)
	enemy.global_position = $Marker2D.global_position
	await get_tree().create_timer(5.0).timeout
	spawn()
