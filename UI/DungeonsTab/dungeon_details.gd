extends VBoxContainer

@export var dungeon: Dungeon;

func _process(_delta: float) -> void:
	if (!dungeon):
		visible = false;
		return;
	visible = true;
	$Name.text = dungeon.dungeon_name;
	$Rooms.text = str(dungeon.rooms.size());
