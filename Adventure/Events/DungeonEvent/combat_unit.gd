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

func _init(unit: Unit, team: Team) -> void:
	_unit = unit;
	_team = team;
	initiative = randi_range(0, 100);
