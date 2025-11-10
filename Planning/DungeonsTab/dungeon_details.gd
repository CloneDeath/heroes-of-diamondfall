extends VBoxContainer

var _dungeon: Dungeon;
var dungeon: Dungeon:
	get:
		return _dungeon;
	set(value):
		_dungeon = value;

func _process(_delta: float) -> void:
	if (!dungeon):
		visible = false;
		return;
	visible = true;
	%Name.text = dungeon.dungeon_name;
	%RoomCount.text = str(dungeon.rooms.size());
