extends CenterContainer


func _on_execute_pressed() -> void:
	get_tree().change_scene_to_file("res://Adventure/adventure.tscn");
