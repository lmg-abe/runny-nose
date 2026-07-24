extends Area2D

func _ready() -> void:
	if Global.got_ear == true:
		queue_free()
#if the player already has the ability, the NPC deletes itself.



func _on_body_entered(body: Node2D) -> void:
	if body.name == "Runny":
		Global.got_ear = true
		queue_free()
#code from the collectables that sets got_hand to true when touched by the player.
