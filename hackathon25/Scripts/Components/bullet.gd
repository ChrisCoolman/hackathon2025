extends Area2D

@export var speed = 1000.0
@export var AttackComponent : AttackComponent

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		body.hitbox.damage($AttackComponent)
	queue_free()
