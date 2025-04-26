extends CharacterBody2D

enum States {Idle, Move, Attack, Die}

@onready var player = get_tree().get_nodes_in_group("player")
@export var speed := 50.0
@export var attackRange := 30.0
@export var attackWait := 0.25

@onready var state = States.Move

@export var hitbox : HitboxComponent

func _ready() -> void:
	pass
	#$Sprite2D.set_instance_shader_parameter("Is Grey", true)

func changeState(newState):
	if newState == States.Idle:
		#play idle animation
		state = States.Idle
	elif newState == States.Move:
		#play moving animation
		state = States.Move
	elif newState == States.Attack:
		state = States.Attack
		await get_tree().create_timer(attackWait).timeout
		if is_instance_valid(player[0]) and self.position.distance_to(player[0].position) <= attackRange:
			player[0].hitbox.damage($AttackComponent)
		changeState(States.Move)
			
	elif newState == States.Die:
		state = States.Die

func _physics_process(delta: float) -> void:
	if state == States.Move and is_instance_valid(player[0]):
		var direction = (player[0].position - global_position).normalized()
		velocity = direction * speed
		move_and_slide()

func _process(delta: float) -> void:
	$ProgressBar.value = $HealthComponent.health
	if is_instance_valid(player[0]) and self.position.distance_to(player[0].position) <= attackRange and state != States.Attack:
		print("attacking")
		changeState(States.Attack)

func kill():
	changeState(States.Die)
	#$Sprite2D.set_instance_shader_parameter("Is Grey", false)
	await get_tree().create_timer(0).timeout
	queue_free()
