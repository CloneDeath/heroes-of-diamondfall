extends HBoxContainer

func _on_dungeon_list_item_selected(index: int) -> void:
	var dungeon = Dungeons.dungeons[index];
	$DungeonDetails.dungeon = dungeon;

func _on_dungeon_details_purchased(dungeon: Dungeon) -> void:
	if (dungeon.permit_cost > Resources.gold): return;
	dungeon.has_permit = true;
