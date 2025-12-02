extends HBoxContainer

@export var feature: Feature;

func _process(_delta: float) -> void:
	if (!feature): return;
	$Name.text = feature.name;
	$Unlock.visible = !feature.unlocked;
	$Unlock.disabled = feature.unlocked || Resources.gold < feature.cost;
	$Unlock.text = "Unlock (" + str(feature.cost) + " gold)"

func _on_unlock_pressed() -> void:
	feature.unlocked = true;
	Resources.gold -= feature.cost;
