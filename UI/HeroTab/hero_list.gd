extends ItemList

var filter: Callable;

func _get_filtered_heroes() -> Array[Hero]:
	var heroes = Heroes.heroes;
	if (filter):
		return heroes.filter(filter);
	return heroes;

func _process(_delta: float) -> void:
	var heroes = _get_filtered_heroes();
	while item_count < heroes.size():
		add_item("New Hero");
	while item_count > heroes.size():
		remove_item(0);
	for i in heroes.size():
		var hero = heroes[i];
		set_item_text(i, hero.unit_name);

func get_selected_hero() -> Hero:
	var indexes = get_selected_items();
	if indexes.size() == 0: return null;
	var index = indexes[0];
	var heroes = _get_filtered_heroes();
	return heroes[index];
