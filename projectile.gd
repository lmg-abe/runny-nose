extends Node

@export var speed : int = 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position.y += speed*delta
	var stuffInArea = get_node("Area2D").get_overlapping_bodies()
	for body in stuffInArea:
		if body.name == "Runny":
			continue
		if body is CharacterBody2D:
			body.die()
		queue_free()
