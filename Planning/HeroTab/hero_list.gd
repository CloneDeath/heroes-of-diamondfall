extends ItemList

var filter: Callable;
@export var mark_assigned: bool = false;

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
		set_item_text(i, _get_hero_text(hero));

func _get_hero_text(hero: Hero) -> String:
	var result = hero.unit_name;
	if (mark_assigned && HeroAssignment.is_assigned(hero)):
		result = "🏯" + result;
	return result;

func get_selected_hero() -> Hero:
	var indexes = get_selected_items();
	if indexes.size() == 0: return null;
	var index = indexes[0];
	var heroes = _get_filtered_heroes();
	return heroes[index];

func has_selection() -> bool:
	var indexes = get_selected_items();
	return indexes.size() > 0;
