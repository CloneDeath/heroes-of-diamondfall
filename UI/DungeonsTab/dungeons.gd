extends HBoxContainer

func _on_dungeon_list_item_selected(index: int) -> void:
	var dungeon = Dungeons.dungeons[index];
	$DungeonDetails.dungeon = dungeon;
