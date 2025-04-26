extends Area2D
signal spawner_killed
@export var progressBar : ProgressBar
@onready var healthcomp = $HealthComponent
func _ready() -> void:
	progressBar.hide()

func _process(delta: float) -> void:
	progressBar.value = healthcomp.health
func kill():
	emit_signal("spawner_killed")
	queue_free()
