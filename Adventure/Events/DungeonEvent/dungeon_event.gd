extends Event
class_name DungeonEvent

var unit_combat_card = preload("res://Adventure/Events/DungeonEvent/unit_combat_card.tscn");

var _dungeon: Dungeon;
var _heroes: Array[Hero];
var _room_number: int = 0;

var room: Room:
	get: return _dungeon.rooms[_room_number];

var process = false;
var progress = 0;
@export var time_per_step: float = 1;
signal _progress_complete;

func init(dungeon: Dungeon) -> void:
	_dungeon = dungeon;
	_room_number = 0;
	$DungeonName.text = dungeon.dungeon_name;
	_heroes = HeroAssignment.get_heroes(dungeon);
	for hero in _heroes:
		var hero_data = unit_combat_card.instantiate();
		hero_data.unit = hero;
		$Heroes.add_child(hero_data);
	for monster in room.monsters:
		var monster_data = unit_combat_card.instantiate();
		monster_data.unit = monster;
		$Enemies.add_child(monster_data);

func _process(delta: float) -> void:
	$RoomNumber.text = "Room #" + str(_room_number+1);

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
	while _combat_should_continue(units):
		for unit: CombatUnit in units:
			if (unit.is_dead()): continue;
			var target = unit.select_target(units);
			unit.attack(target);
			await _progress_complete;
			if (!_combat_should_continue(units)):
				break;

func _combat_should_continue(units: Array[CombatUnit]) -> bool:
	var hero = units.filter(func(unit:CombatUnit):
		return unit.team == CombatUnit.Team.hero && unit.is_alive();
	);
	var monster = units.filter(func(unit:CombatUnit):
		return unit.team == CombatUnit.Team.monster && unit.is_alive();
	);
	return hero && monster;

func _get_combat_units() -> Array[CombatUnit]:
	var units: Array[CombatUnit] = [];
	for hero in _heroes:
		units.push_back(CombatUnit.new(hero, CombatUnit.Team.hero));
	for monster in room.monsters:
		units.push_back(CombatUnit.new(monster, CombatUnit.Team.monster));
	units.sort_custom(func (a, b):
		return a.initiative < b.initiative;
	);
	return units;
