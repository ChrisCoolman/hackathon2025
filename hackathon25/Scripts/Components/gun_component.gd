extends Node2D
class_name GunComponent

@export var bulletScene : PackedScene

@export var bulletsPerShot := 1
@export var shotCooldown := 0.2 
@export var damagePerShot := 10.0
@export var magSize := 15
@export var reloadTime := 2.0
@onready var mag = magSize

var reloading = false
var cooldown = false

func _ready() -> void:
	$Timer.wait_time = shotCooldown

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())

func shoot():
	print(reloading)
	if mag > 0 and reloading == false and cooldown == false:
		$Timer.start()
		mag-=1
		cooldown = true
		for i in bulletsPerShot:
			makeBullet()
	if reloading == false and mag < 1:
		reload()
		
func makeBullet():
	var bullet = bulletScene.instantiate()
	get_tree().root.add_child(bullet)
	bullet.global_transform = $Muzzle.global_transform
	bullet.AttackComponent.attack_damage = damagePerShot

func reload():
	reloading = true
	print("reloading")
	await get_tree().create_timer(reloadTime).timeout
	print("reloaded")
	mag = magSize
	reloading = false

func _on_timer_timeout() -> void:
	cooldown = false
