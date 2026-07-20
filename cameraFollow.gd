extends Camera2D

var playerPos : Vector2
var myPos : Vector2
@export var smoothing : float = 4.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	myPos = get_position()
	playerPos = get_parent().get_node("Runny").position
	
	set_position(myPos+(Vector2(playerPos.x-myPos.x,playerPos.y-myPos.y))/smoothing)
