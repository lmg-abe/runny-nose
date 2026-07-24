extends Camera2D

var playerPos : Vector2
var myPos : Vector2
@export var smoothing : float = 4.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.lastCheckpoint!=0:
		position=Global.checkpointPos


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	myPos = get_position()
	playerPos = get_parent().get_node("Runny").position
	if (playerPos.x<1300):
		playerPos.x=1300
	if (playerPos.y>128*-3):
		playerPos.y=128*-3
	
	set_position(myPos+(Vector2(playerPos.x-myPos.x,playerPos.y-myPos.y))/smoothing)
