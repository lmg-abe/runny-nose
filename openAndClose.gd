extends StaticBody2D

var targetPos : Vector2 = get_position()
var myPos : Vector2
var startPos : Vector2 = get_position()
@export var smoothing : float = 4.0
var opening : bool = false

func open():
	opening=true
	targetPos = startPos-Vector2(0,128*4)
func close():
	opening=false
	targetPos = startPos

func _process(delta: float) -> void:
	myPos = get_position()
	set_position(myPos+(Vector2(targetPos.x-myPos.x,targetPos.y-myPos.y))/smoothing)
