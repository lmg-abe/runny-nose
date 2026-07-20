extends CharacterBody2D

@export var playerSpeed : int = 200
@export var friction : float = 0.8

func _physics_process(delta: float) -> void:
	velocity.x += Input.get_axis("move_left","move_right") * playerSpeed
	velocity.x *= friction
	move_and_slide()
