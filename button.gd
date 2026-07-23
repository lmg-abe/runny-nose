extends Area2D

@export var doorObj : String = "Door"

#func _on_body_entered(body: Node2D) -> void:
	#var node = get_parent().get_node(doorObj)
	#node.open()
#
#
#func _on_body_exited(body: Node2D) -> void:
	#var node = get_parent().get_node(doorObj)
	#node.close()

func _process(delta: float) -> void:
	var stuffOnButton = self.get_overlapping_bodies()
	var node = get_parent().get_node(doorObj)
	for body in stuffOnButton:
		if body is RigidBody2D or body is CharacterBody2D:
			node.open()
	if len(stuffOnButton)==0:
		node.close()
