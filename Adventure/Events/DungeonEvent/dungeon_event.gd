extends Event
class_name DungeonEvent

var unit_combat_card = preload("res://Adventure/Events/DungeonEvent/unit_combat_summary.tscn");

var _dungeon: Dungeon;
var _heroes: Array[Hero];

var process = false;
var progress = 0;
@export var time_per_step: float = 2;
signal _progress_complete;

func init(dungeon: Dungeon) -> void:
	_dungeon = dungeon;
	$DungeonName.text = dungeon.dungeon_name;
	_heroes = HeroAssignment.get_heroes(dungeon);
	for hero in _heroes:
		var hero_data = unit_combat_card.instantiate();
		hero_data.unit = hero;
		$Heroes.add_child(hero_data);
	var room = dungeon.rooms.front();
	for monster in room.monsters:
		var monster_data = unit_combat_card.instantiate();
		monster_data.unit = monster;
		$Enemies.add_child(monster_data);

func _process(delta: float) -> void:
	if (!process): return;

	progress += delta / time_per_step;
	$ProgressBar.value = progress;
	if (progress >= 1):
		progress = 0;
		_progress_complete.emit();

func execute() -> void:
	process = true;
	await _progress_complete;

	var units = _get_combat_units();
	units[0].hp = 10;
	await _progress_complete;


func _get_combat_units() -> Array[CombatUnit]:
	var units: Array[CombatUnit] = [];
	for hero in _heroes:
		units.push_back(CombatUnit.new(hero, CombatUnit.Team.hero));
	for monster in _dungeon.rooms[0].monsters:
		units.push_back(CombatUnit.new(monster, CombatUnit.Team.monster));
	units.sort_custom(func (a, b):
		return a.initiative < b.initiative;
	);
	return units;
