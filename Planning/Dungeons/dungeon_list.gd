extends ItemList

func _process(_delta: float) -> void:
	var dungeons = Dungeons.dungeons;
	while item_count < dungeons.size():
		add_item("New Dungeon");
	while item_count > dungeons.size():
		remove_item(-1);
	for i in dungeons.size():
		var dungeon = dungeons[i];
		set_item_text(i, _get_dungeon_display_name(dungeon));

func _get_dungeon_display_name(dungeon: Dungeon) -> String:
	var result = dungeon.dungeon_name;
	if (!dungeon.has_permit): result += " 🔒"
	return result;
