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
var canDash : bool = true
var jumpTimer : int = -1
@export var pushForce = 1500
var facingDirection : int = 1
var standAnim = load('res://runnyNoseStand.png')
var run1Anim = load('res://runnyNoseRun1.png')
var run2Anim = load('res://runnyNoseRun2.png')
var jumpAnim = load('res://runnyNoseJump.png')
var fallAnim = load('res://runnyNoseFall.png')
var walkAnim : int = 0
var dashCooldown : int = 3
var dashTimer : int = -1
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("move_left"): facingDirection = -1
	if Input.is_action_pressed("move_right"): facingDirection = 1
	get_node("Icon").flip_h = (facingDirection<0)
	if is_on_floor():
		if Input.get_axis("move_left","move_right")!=0:
			if walkAnim<=10:
				get_node("Icon").texture = run2Anim
			else:
				get_node("Icon").texture = run1Anim
			walkAnim+=1
			walkAnim%=20
		else:
			get_node("Icon").texture = standAnim
	else:
		walkAnim=0
		if velocity.y < 0:
			get_node("Icon").texture = jumpAnim
		else:
			get_node("Icon").texture = fallAnim
		
	velocity.x += Input.get_axis("move_left","move_right") * playerSpeed
	velocity.x *= friction
	if is_on_floor() :
		canSneeze = true
	if canDash and Input.is_action_just_pressed("dash") :
		velocity.x+=Input.get_axis("move_left","move_right")*dashSpeed
		if velocity.y > 0 :
			velocity.y = 0
		canDash = false
		dashTimer =+ 1
		#Add a Dash Cooldown. 
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
	
