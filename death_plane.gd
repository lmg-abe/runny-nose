extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Runny":
		Global.deaths += 1
		Global.died.emit()
		get_tree().reload_current_scene.call_deferred()
