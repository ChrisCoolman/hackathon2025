extends CharacterBody2D

@onready var player = get_tree().get_nodes_in_group("player")
@export var speed := 200.0

@export var hitbox : HitboxComponent

func _physics_process(delta: float) -> void:
	var direction = (player[0].position - global_position).normalized()
	velocity = direction * speed
	move_and_slide()

func kill():
	queue_free()
