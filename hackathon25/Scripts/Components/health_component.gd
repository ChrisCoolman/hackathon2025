extends Node2D
class_name HealthComponent

@export var MAX_HEALTH := 100.0
var health

func _ready() -> void:
	health = MAX_HEALTH

func damage(attack: AttackComponent):
	health -= attack.attack_damage
	if get_parent().is_in_group("player"):
		get_parent().get_node("AnimationPlayer").play("screen_flash")
	print(health)
	if health <= 0:
		get_parent().kill()
