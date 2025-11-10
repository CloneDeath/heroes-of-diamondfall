extends VBoxContainer

var _service: Service;

var service: Service:
	get: return _service;
	set(value): _service = value;

func _process(_delta: float) -> void:
	if (!service):
		visible = false;
		return;
	visible = true;
	%Name.text = service.service_name;
	%Unlock.text = "Unlock (%s gold)" % service.cost;
	%Unlock.visible = !service.unlocked;
	%Unlock.disabled = service.unlocked || Resources.gold < service.cost;

func _on_unlock_pressed() -> void:
	service.unlocked = true;
	Resources.gold -= service.cost;
