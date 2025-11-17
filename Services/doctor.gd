extends Service
class_name Doctor

var healing = Feature.new("Healing", 50);
func _get_features() -> Array[Feature]:
	return [healing];

func _init() -> void:
	service_name = "Doctor";
	cost = 10;
	description = "The Doctor can help heroes heal faster between adventures";
	texture = preload("res://Services/doctor.png")
