extends Service
class_name Blacksmith

var sword = Feature.new("Sword", 10);
func _get_features() -> Array[Feature]:
	return [sword];

func _init() -> void:
	service_name = "Blacksmith";
	cost = 10;
	description = "The Blacksmith creates weapons and armors for your heroes";
	texture = preload("res://Services/blacksmith.png");
