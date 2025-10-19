extends HBoxContainer

func _on_hero_list_item_selected(index: int) -> void:
	var hero = Heroes.heroes[index];
	$Details.hero = hero;
