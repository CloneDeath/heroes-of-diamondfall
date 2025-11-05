extends Node

var assignments: Dictionary[int, int];

func assign(hero: Hero, dungeon: Dungeon) -> void:
	assignments[hero.id] = dungeon.id;

func unassign(hero: Hero) -> void:
	assignments.erase(hero.id);

func clear() -> void:
	assignments.clear();

func is_assigned(hero: Hero) -> bool:
	return assignments.has(hero.id);

func get_dungeon(hero: Hero) -> Dungeon:
	if (!assignments.has(hero.id)):
		return null;
	var id = assignments.get(hero.id);
	return Dungeons.get_dungeon(id);

func get_heroes(dungeon: Dungeon) -> Array[Hero]:
	var heroes: Array[Hero] = [];
	for hero in Heroes.heroes:
		var id = assignments[hero.id];
		if (id == dungeon.id):
			heroes.push_back(hero);
	return heroes;
