extends Event
class_name DungeonEvent

var _dungeon: Dungeon;
var _units: CombatUnits;
var _room: Room;

var process = false;
var progress = 0;
@export var time_per_step: float = 1;
signal _progress_complete;

func init(dungeon: Dungeon) -> void:
	_dungeon = dungeon;
	$DungeonName.text = dungeon.dungeon_name;
	_units = CombatUnits.new(dungeon);
	$Heroes.units = _units.heroes;
	_load_room_and_units();

func _process(delta: float) -> void:
	if (_dungeon):
		%DungeonProgress.value = _dungeon.progress() * 100;
	if (!process): return;

	progress += delta / time_per_step;
	$ProgressBar.value = progress;
	if (progress >= 1):
		progress = 0;
		_progress_complete.emit();

func execute() -> void:
	process = true;
	await _progress_complete;

	while _room && _combat_should_continue():
		for unit: CombatUnit in _units.all:
			if (unit.is_dead()): continue;
			var target = unit.select_target(_units.all);
			unit.attack(target);
			await _progress_complete;
			if (!_combat_should_continue()):
				break;
		if (_units._all_monsters_are_dead()):
			_load_next_room();

func _load_next_room() -> void:
	_dungeon.on_complete(_room);
	if (_dungeon.has_monsters()):
		_load_room_and_units();
		await _progress_complete;
	else:
		_room = null;

func _combat_should_continue() -> bool:
	var living_heroes = _units.heroes.filter(func(unit:CombatUnit):
		return unit.is_alive();
	).size();
	var living_monsters = _units.monsters.filter(func(unit:CombatUnit):
		return unit.is_alive();
	).size();
	return living_heroes > 0 && living_monsters > 0;

func _load_room_and_units() -> void:
	_room = _dungeon.get_room();
	_units.set_room(_room);
	$Enemies.units = _units.monsters;
