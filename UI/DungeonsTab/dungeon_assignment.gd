extends HBoxContainer

@export var dungeon: Dungeon;

func _ready() -> void:
	%AssignedHeroes.filter = _assigned_dungeon;
	%UnassignedHeroes.filter = _not_assigned_dungeon;

func _assigned_dungeon(hero: Hero) -> bool:
	if (!dungeon): return false;
	var assigned = HeroAssignment.get_dungeon(hero);
	if (!assigned):
		return false;
	return assigned.id == dungeon.id;

func _not_assigned_dungeon(hero: Hero) -> bool:
	return !_assigned_dungeon(hero);

func _on_assign_pressed() -> void:
	var hero = %UnassignedHeroes.get_selected_hero();
	HeroAssignment.assign(hero, dungeon);

func _on_unassign_pressed() -> void:
	var hero = %AssignedHeroes.get_selected_hero();
	HeroAssignment.unassign(hero);
