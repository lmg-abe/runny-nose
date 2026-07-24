extends CharacterBody2D

@export var speed : int = 5
@export var gravity : int = 100
@onready var ray_cast_2d: RayCast2D = $RayCast2D
var facingDirection : int = 1
var animTimer : int = 0

func _physics_process(delta: float) -> void:
	animTimer+=1
	position.x+=speed*facingDirection
	velocity.y+=gravity
	if ray_cast_2d.is_colliding():
		ray_cast_2d.target_position.x *= -1
		facingDirection *= -1
	get_node("Icon").flip_h = (facingDirection==1)
	get_node("Icon").scale.y = 1-(sin(deg_to_rad(animTimer*6))/10.0)
	get_node("Icon").scale.x = 1/get_node("Icon").scale.y
	move_and_slide()

func die():
	queue_free()	
