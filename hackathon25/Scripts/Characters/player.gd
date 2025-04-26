extends CharacterBody2D

@export var speed = 400
@onready var hitbox = $HitboxComponent

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	look_at(get_global_mouse_position())
	move_and_slide()
	
func _process(delta: float) -> void:
	$CanvasLayer/HUD/Label.text = "Ammo: " + str($GunComponent.mag)
	if Input.is_action_pressed("shoot"):
		$GunComponent.shoot()
	elif Input.is_action_pressed("reload"):
		$GunComponent.reload()

func kill():
	queue_free()
