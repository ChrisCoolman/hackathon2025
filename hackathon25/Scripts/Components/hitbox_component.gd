extends Area2D
class_name HitboxComponent

@export var health_component : HealthComponent

func damage(attack: AttackComponent):
	health_component.damage(attack)
