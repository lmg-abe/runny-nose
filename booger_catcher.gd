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

#func _process(delta: float) -> void:
	#var stuffOnButton = self.get_overlapping_bodies()
	
	#var foundValidButtonPresser = false
	#get_node("Icon").position = Vector2(0,0)
	#for body in stuffOnButton:
		#if body is RigidBody2D or body is CharacterBody2D:
			#
			#get_node("Icon").position = Vector2(0,32)
			#foundValidButtonPresser = true
	#if not foundValidButtonPresser:
		#node.close()

func booger():
	var node = get_parent().get_node(doorObj)
	node.open()
	get_node("Icon").get_node("Icon_Booger").visible = true
