extends Area2D

@export var doorObj : String = "Door"

func _on_body_entered(body: Node2D) -> void:
	var node = get_parent().get_node(doorObj)
	node.open()


func _on_body_exited(body: Node2D) -> void:
	var node = get_parent().get_node(doorObj)
	node.close()
