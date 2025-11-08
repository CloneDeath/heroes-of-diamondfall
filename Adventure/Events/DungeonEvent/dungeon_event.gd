extends Event
class_name DungeonEvent

var _dungeon: Dungeon;
var _units: Array[CombatUnit];
var _room_number: int = 0;
var _unit_cards: Dictionary[CombatUnit, UnitCombatCard];

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
	_units = _get_combat_units();
	for unit in _units:
		var card: UnitCombatCard;
		if (unit.team == CombatUnit.Team.hero):
			card = $Heroes.add_unit(unit);
		else:
			card = $Enemies.add_unit(unit);
		_unit_cards[unit] = card;

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

	while _combat_should_continue():
		for unit: CombatUnit in _units:
			if (unit.is_dead()): continue;
			var target = unit.select_target(_units);
			unit.attack(target);
			await _unit_cards.get(unit).attack();
			await _progress_complete;
			if (!_combat_should_continue()):
				break;

func _combat_should_continue() -> bool:
	var hero = _units.filter(func(unit:CombatUnit):
		return unit.team == CombatUnit.Team.hero && unit.is_alive();
	);
	var monster = _units.filter(func(unit:CombatUnit):
		return unit.team == CombatUnit.Team.monster && unit.is_alive();
	);
	return hero && monster;

func _get_combat_units() -> Array[CombatUnit]:
	var units: Array[CombatUnit] = [];
	for hero in HeroAssignment.get_heroes(_dungeon):
		units.push_back(CombatUnit.new(hero, CombatUnit.Team.hero));
	for monster in room.monsters:
		units.push_back(CombatUnit.new(monster, CombatUnit.Team.monster));
	units.sort_custom(func (a, b):
		return a.initiative < b.initiative;
	);
	return units;
