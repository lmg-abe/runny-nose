extends CharacterBody2D

@export var playerSpeed : int = 200
@export var friction : float = 0.8
@export var dashSpeed : int = 2000
@export var gravity : int = 100
var grounded : bool = false

func _physics_process(delta: float) -> void:
	velocity.x += Input.get_axis("move_left","move_right") * playerSpeed
	velocity.x *= friction
	if Input.is_action_just_pressed("dash"):
		velocity.x+=Input.get_axis("move_left","move_right")*dashSpeed
	velocity.y += gravity
	move_and_slide()
