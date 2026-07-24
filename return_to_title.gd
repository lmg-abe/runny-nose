extends Button




func _on_pressed() -> void:
	Global.deaths=0
	Global.collectables=0
	Global.got_ear = false
	Global.got_hand = false
	get_tree().change_scene_to_file("res://menu.tscn")
