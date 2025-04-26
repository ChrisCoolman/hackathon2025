extends Node2D
@export var type := "magSize"
var is_anim = false
func _on_area_2d_body_entered(body: Node2D) -> void:
	if is_anim == false:
		is_anim = true
		$Sprite2D.hide()
		if body.is_in_group("player"):
			body.powerupAmount += 1
			match type:
				"magSize":
					body.gun.magSize += 1
					$AnimationPlayer.play("popup")
					await $AnimationPlayer.animation_finished
					await get_tree().create_timer(1.0).timeout
					self.queue_free()
				"damage":
					body.gun.damagePerShot += 2.0
					$AnimationPlayer.play("popup")
					await $AnimationPlayer.animation_finished
					await get_tree().create_timer(1.0).timeout
					self.queue_free()
				"cooldown":
					body.gun.shotCooldown -= 0.05
					$AnimationPlayer.play("popup")
					await $AnimationPlayer.animation_finished
					await get_tree().create_timer(1.0).timeout
					self.queue_free()
