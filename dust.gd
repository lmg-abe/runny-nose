extends Sprite2D

var alpha : float = .8
var rotVel : float = 10
var rng = RandomNumberGenerator.new()

func _ready():
	rotation = deg_to_rad(rng.randf_range(0, 360))
	var rotVel : float = rng.randf_range(1.0, 15.0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	modulate = Color(1,1,1,alpha)
	alpha-=.8*delta
	rotate(rotVel*delta)
	rotVel-=10*delta
	if rotVel<=0:
		rotVel=0
	if alpha<=0:
		queue_free()
