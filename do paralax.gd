extends Sprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	set_position(Vector2((-get_parent().position.x) / 10, 0))
