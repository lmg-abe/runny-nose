extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "Unnamed Collectables: " + str(Global.collectables)
	Global.update_collectables.connect(_on_update_collectables)
func _on_update_collectables():
	text = "Unnamed Collectables: " + str(Global.collectables)
