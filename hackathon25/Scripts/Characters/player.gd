extends CharacterBody2D

@export var speed = 200.0
@export var powerupAmount := 0
@onready var hitbox = $HitboxComponent
@onready var anim: AnimatedSprite2D = $as
@export var gun : GunComponent
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
	
func _process(delta: float) -> void:
	$CanvasLayer/HUD/Health.text = str(roundi($HealthComponent.health))
	$CanvasLayer/HUD/Ammo.text = str($GunComponent.mag)
	
	if Input.is_action_pressed("shoot"):
		$GunComponent.shoot()
		if $GunComponent.reloading == false:
			$Camera2D.apply_shake(1.5)
	elif Input.is_action_pressed("reload"):
		$GunComponent.reload()
		
	if Input.is_action_pressed("up"):
		anim.play("up")
	elif Input.is_action_pressed("down"):
		anim.play("down")
	elif Input.is_action_pressed("left"):
		anim.play("left")
	elif Input.is_action_pressed("right"):
		anim.play("right")
	else:
		anim.play("idle")

func kill():
	get_tree().change_scene_to_file("res://Scenes/User Interface/main_menu.tscn")
	queue_free()
