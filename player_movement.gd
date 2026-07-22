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
var facingDirection : int = 1
var standAnim = load('res://runnyNoseStand.png')
var run1Anim = load('res://runnyNoseRun1.png')
var run2Anim = load('res://runnyNoseRun2.png')
var jumpAnim = load('res://runnyNoseJump.png')
var fallAnim = load('res://runnyNoseFall.png')
var walkAnim : int = 0
var thingyInHandArea : bool = false
var holdingThing : bool = false
var box
var movementMultiplier : float = 1

func _ready() -> void:
	Global.update_goops.connect(_on_update_goops)
	Global.update_bubbles.connect(_on_update_bubbles)

func _on_update_goops() :
	canSneeze = true

func  _on_update_bubbles():
	canDash = true

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("move_left"): facingDirection = -1
	if Input.is_action_pressed("move_right"): facingDirection = 1
	get_node("Icon").flip_h = (facingDirection<0)
	if is_on_floor():
		if Input.get_axis("move_left","move_right")!=0:
			if walkAnim<=int(10.0/movementMultiplier):
				get_node("Icon").texture = run2Anim
			else:
				get_node("Icon").texture = run1Anim
			walkAnim+=1
			walkAnim%=int(20.0/movementMultiplier)
		else:
			get_node("Icon").texture = standAnim
	else:
		walkAnim=0
		if velocity.y < 0:
			get_node("Icon").texture = jumpAnim
		else:
			get_node("Icon").texture = fallAnim
	
	# set down boxes
	if holdingThing and Input.is_action_just_pressed("pick_up"):
		box.position = Vector2(200*facingDirection,60)
		box.freeze = false
		holdingThing = false
		box.reparent(get_parent())
	
	# move HandArea to the side the player is facing
	get_node("HandArea").position = Vector2(150*facingDirection,60)
	# pick up boxes
	if Input.is_action_just_pressed("pick_up") and not holdingThing:
		var stuffInHandArea = get_node("HandArea").get_overlapping_bodies()
		for body in stuffInHandArea:
			if body is RigidBody2D:
				body.freeze = true
				body.reparent(self)
				body.position = Vector2(0,-200)
				holdingThing = true
				box = body
				
	
	if holdingThing:
		movementMultiplier=.5
	else:
		movementMultiplier=1
	
	velocity.x += Input.get_axis("move_left","move_right") * playerSpeed * movementMultiplier
	velocity.x *= friction
	if is_on_floor() :
		canSneeze = true
		canDash = true
	if canDash and Input.is_action_just_pressed("dash") and not holdingThing:
		velocity.x+=Input.get_axis("move_left","move_right")*dashSpeed
		if velocity.y > 0 :
			velocity.y = 0
		canDash = false
	if !Input.is_action_pressed("jump") or is_on_floor() or jumpTimer > jumpRiseTime:
		jumpTimer=-1
	if Input.is_action_just_pressed("jump") and is_on_floor() and not holdingThing:
		jumpTimer+=1
	if jumpTimer>-1:
		velocity.y=-jumpSpeed
		jumpTimer+=1
		
	if canSneeze and Input.is_action_just_pressed("sneeze") and not holdingThing:
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
	
