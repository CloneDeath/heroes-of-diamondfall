extends ItemList

func _init() -> void:
	var services = Services.services;
	for i in services.size():
		var service = services[i];
		add_item(_get_service_display_name(service));

func _process(_delta: float) -> void:
	var services = Services.services;
	for i in services.size():
		var service = services[i];
		set_item_text(i, _get_service_display_name(service));

func _get_service_display_name(service: Service) -> String:
	var result = service.service_name;
	if (!service.unlocked): result += " 🔒"
	return result;
