extends Node
class_name CombatUnit

enum Team {
	hero, monster
};

var _unit: Unit;
var _team: Team;
var initiative = 0;

var hp: int:
	get: return _unit.hp;
	set(value): _unit.hp = value;

var team: Team:
	get: return _team;

func _init(unit: Unit, assigned_team: Team) -> void:
	_unit = unit;
	_team = assigned_team;
	initiative = randi_range(0, 100);

func is_alive() -> bool: return _unit.hp > 0;
func is_dead() -> bool: return !is_alive();

func select_target(other: Array[CombatUnit]) -> CombatUnit:
	var enemies = other.filter(func (unit):
		return unit._team != _team;
	);
	var random_idx = randi_range(0, enemies.size() - 1);
	return enemies[random_idx];

func attack(other: CombatUnit) -> void:
	other.hp = int(move_toward(other.hp, 0, _unit.strength));
