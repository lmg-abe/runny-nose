extends CharacterBody2D

@export var playerSpeed : int = 150
@export var friction : float = 0.9
@export var dashSpeed : int = 2000
@export var gravity : int = 100
@export var jumpSpeed : int = 1200
@export var secondJumpSpeed : int = 2000
@export var maxRise : int = -2000
@export var jumpRiseTime : int = 12
var canSneeze : bool = false
var canDash : bool = false
var jumpTimer : int = -1
@export var pushForce = 1500

func _physics_process(delta: float) -> void:
	velocity.x += Input.get_axis("move_left","move_right") * playerSpeed
	velocity.x *= friction
	if is_on_floor() :
		canSneeze = true
		canDash = true
	if canDash and Input.is_action_just_pressed("dash") :
		velocity.x+=Input.get_axis("move_left","move_right")*dashSpeed
		if velocity.y > 0 :
			velocity.y = 0
		canDash = false
	if !Input.is_action_pressed("jump") or is_on_floor() or jumpTimer > jumpRiseTime:
		jumpTimer=-1
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jumpTimer+=1
	if jumpTimer>-1:
		velocity.y=-jumpSpeed
		jumpTimer+=1
		
	if canSneeze and Input.is_action_just_pressed("sneeze") :
		if velocity.y > 0 :
			velocity.y = 0
		velocity.y -= secondJumpSpeed
		canSneeze = false
	if velocity.y < maxRise :
		velocity.y = maxRise
	velocity.y += gravity
	move_and_slide()
	#if move_and_slide(): # true if collided
		#for i in get_slide_collision_count():
			#var col = get_slide_collision(i)
			#if col.get_collider() is RigidBody2D:
				#col.get_collider().apply_force(col.get_normal() * -pushForce)
	
