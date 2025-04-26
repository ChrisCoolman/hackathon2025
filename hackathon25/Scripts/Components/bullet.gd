extends Area2D

@export var speed = 1000.0
@export var AttackComponent : AttackComponent

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_Bullet_body_entered(body):
	if body.is_in_group("enemy"):
		body.hitbox.damage($AttackComponent)
		print(body)
	queue_free()
