extends HBoxContainer

func _on_service_list_item_selected(index: int) -> void:
	var service = Services.services[index];
	$ServiceDetails.service = service;
