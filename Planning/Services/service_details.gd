extends VBoxContainer

var _service: Service;

var service: Service:
	get: return _service;
	set(value):
		_service = value;
		_set_features();

func _process(_delta: float) -> void:
	if (!service):
		visible = false;
		return;
	visible = true;
	%Name.text = service.service_name;
	%Description.text = service.description;
	%Texture.texture = service.texture;
	%Unlock.text = "Unlock (%s gold)" % service.cost;
	%Unlock.visible = !service.unlocked;
	%Unlock.disabled = service.unlocked || Resources.gold < service.cost;
	%Features.visible = service.unlocked;

func _on_unlock_pressed() -> void:
	service.unlocked = true;
	Resources.gold -= service.cost;

var featureUI = preload("res://Planning/Services/feature.tscn");
func _set_features() -> void:
	for child in %Features.get_children():
		child.queue_free();
	for feature in service.features:
		var row = featureUI.instantiate();
		row.feature = feature;
		%Features.add_child(row);
