extends ItemList

func _process(_delta: float) -> void:
	var dungeons = Dungeons.dungeons;
	while item_count < dungeons.size():
		add_item("New Dungeon");
	while item_count > dungeons.size():
		remove_item(-1);
	for i in dungeons.size():
		var dungeon = dungeons[i];
		set_item_text(i, dungeon.dungeon_name);
