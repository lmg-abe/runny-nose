extends Area2D
var animTimer : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	animTimer+=1
	get_node("Icon").position = Vector2(0,sin((deg_to_rad(animTimer*5)))*8)



func _on_body_entered(body: Node2D) -> void:
	Global.bubbles += 1
	Global.update_bubbles.emit()
	queue_free()
