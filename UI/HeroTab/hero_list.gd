extends ItemList

func _process(_delta: float) -> void:
	var heroes = Heroes.heroes;
	while item_count < heroes.size():
		add_item("New Hero");
	while item_count > heroes.size():
		remove_item(-1);
	for i in heroes.size():
		var hero = heroes[i];
		set_item_text(i, hero.hero_name);
