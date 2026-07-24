extends Area2D

@export var amount : int = 1
var animTimer : int = 0

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Runny":
		Global.collectables+=amount
		Global.update_collectables.emit()
		get_parent().get_node("Runny").get_node("collect").play()
		queue_free()

func _process(delta: float) -> void:
	animTimer+=1
	get_node("Icon").position = Vector2(0,sin((deg_to_rad(animTimer*5)))*8)
