extends Panel

func show_results(dungeon: Dungeon, total_gold: int) -> void:
	await _add_line_item("Total: " + str(total_gold) + " gold");

	var heroes = HeroAssignment.get_heroes(dungeon);
	var guild_share = ceili(total_gold * .3);
	var hero_share = total_gold - guild_share;
	@warning_ignore("integer_division")
	var per_hero_share = hero_share / heroes.size();
	for hero in heroes:
		hero.gold += per_hero_share;
	var hero_total = per_hero_share * heroes.size();
	var leftover = hero_share - hero_total;
	Resources.gold += guild_share + leftover;

	await _add_line_item("Hero Share: " + str(hero_total) + " gold");
	await _add_line_item("Guild Share: " + str(guild_share + leftover) + " gold");

	var button = Button.new();
	button.text = "Continue";
	$Itemization.add_child(button);
	await button.pressed;

func _add_line_item(text: String) -> void:
	var label = Label.new();
	label.text = text;
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER;
	$Itemization.add_child(label);
	await _wait_one();

func _wait_one():
	await get_tree().create_timer(1).timeout;
