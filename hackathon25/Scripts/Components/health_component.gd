extends Node2D
class_name HealthComponent

@export var MAX_HEALTH := 100.0
var health

func _ready() -> void:
	health = MAX_HEALTH

func damage(attack: AttackComponent):
	health -= attack.attack_damage
	print(health)
	if health <= 0:
		get_parent().kill()
