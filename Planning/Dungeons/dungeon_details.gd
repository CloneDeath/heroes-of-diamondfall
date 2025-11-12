extends VBoxContainer

signal purchased(dungeon: Dungeon);

var dungeon: Dungeon;

func _process(_delta: float) -> void:
	if (!dungeon):
		visible = false;
		return;
	visible = true;
	%Name.text = dungeon.dungeon_name;
	%Progress.value = dungeon.progress();
	%Cost.text = str(dungeon.permit_cost) + " Gold";
	%Cost.visible = !dungeon.has_permit;
	%Purchase.disabled = dungeon.has_permit;
	%Purchase.visible = !dungeon.has_permit;

func _on_purchase_pressed() -> void:
	purchased.emit(dungeon);
