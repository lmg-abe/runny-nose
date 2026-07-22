extends Area2D

@export var amount : int = 1

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Runny":
		Global.collectables+=amount
		Global.update_collectables.emit()
		queue_free()
