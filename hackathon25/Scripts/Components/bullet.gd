extends Area2D

@export var speed = 1000.0
@export var AttackComponent : AttackComponent

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_body_entered(body: Node2D) -> void:
	print("hit")
	if body.is_in_group("enemy"):
		print('enemy')
		body.hitbox.damage($AttackComponent)
	await get_tree().create_timer(1).timeout
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("spawner"):
		area.healthcomp.damage($AttackComponent)
		area.progressBar.show()
	await get_tree().create_timer(1).timeout
	queue_free()
