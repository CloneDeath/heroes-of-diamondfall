extends Node
class_name CombatUnits

var heroes: Array[CombatUnit] = [];
var monsters: Array[CombatUnit] = [];
var all: Array[CombatUnit]:
	get:
		var results: Array[CombatUnit] = [];
		for hero in heroes: results.push_back(hero);
		for monster in monsters: results.push_back(monster);
		results.sort_custom(func (a: CombatUnit, b: CombatUnit):
			return a.initiative < b.initiative;
		);
		return results;

func _init(dungeon: Dungeon) -> void:
	for hero in HeroAssignment.get_heroes(dungeon):
		heroes.push_back(CombatUnit.new(hero, CombatUnit.Team.hero));

func _get_combat_units() -> Array[CombatUnit]:
	var units: Array[CombatUnit] = [];
	return units;

func _all_monsters_are_dead() -> bool:
	var living_monsters = monsters.filter(func(unit:CombatUnit):
		return unit.is_alive();
	).size();
	return living_monsters == 0;

func set_room(room: Room) -> void:
	monsters.clear();
	for monster in room.monsters:
		monsters.push_back(CombatUnit.new(monster, CombatUnit.Team.monster));
	pass;
