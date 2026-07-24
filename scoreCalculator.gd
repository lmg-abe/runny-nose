extends Label

var score : float

var ranks = ["F", "D", "C", "B", "A", "S", "S+"]
var yourRank : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score = ((Global.collectables) / (Global.deaths+1.0)) * 100
	text = "\nYour Score: "+str(int(score))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
