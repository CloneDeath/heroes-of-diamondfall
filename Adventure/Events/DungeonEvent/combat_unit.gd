extends Node
class_name CombatUnit

signal attacked(damage: int)
signal attacks(target: Unit)

enum Team {
	hero, monster
};

var _unit: Unit;
var _team: Team;
var initiative = 0;

var hp: int:
	get: return _unit.hp;
	set(value): _unit.hp = value;
var max_hp: int:
	get: return _unit.max_hp;
var unit_name: String:
	get: return _unit.unit_name;
var battle_texture: Texture2D:
	get: return _unit.battle_texture;

var team: Team:
	get: return _team;

func _init(unit: Unit, assigned_team: Team) -> void:
	_unit = unit;
	_unit.attacked.connect(func(damage): attacked.emit(damage));
	_unit.attacks.connect(func(target): attacks.emit(target));

	_team = assigned_team;
	initiative = unit.get_initiative();

func is_alive() -> bool: return _unit.hp > 0;
func is_dead() -> bool: return !is_alive();

func select_target(other: Array[CombatUnit]) -> CombatUnit:
	var enemies = other.filter(func (unit: CombatUnit):
		return unit._team != _team && unit.is_alive();
	);
	var random_idx = randi_range(0, enemies.size() - 1);
	return enemies[random_idx];

func attack(other: CombatUnit) -> void:
	_unit.attack(other._unit);
