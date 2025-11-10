extends Service
class_name Blacksmith

func _init() -> void:
	service_name = "Blacksmith";
	cost = 10;
	description = "The Blacksmith creates weapons and armors for your heroes";
	texture = preload("res://Services/blacksmith.png");
