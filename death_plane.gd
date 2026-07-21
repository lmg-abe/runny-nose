extends Area2D


func _on_body_entered(body: Node2D) -> void:
	Global.deaths += 1
	get_tree().reload_current_scene.call_deferred()
