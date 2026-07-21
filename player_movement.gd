extends CharacterBody2D

@export var playerSpeed : int = 200
@export var friction : float = 0.8
@export var dashSpeed : int = 2000
@export var gravity : int = 100
@export var jumpSpeed : int = 2500

func _physics_process(delta: float) -> void:
	velocity.x += Input.get_axis("move_left","move_right") * playerSpeed
	velocity.x *= friction
	if Input.is_action_just_pressed("dash"):
		velocity.x+=Input.get_axis("move_left","move_right")*dashSpeed
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y=-jumpSpeed
	velocity.y += gravity
	move_and_slide()
	
