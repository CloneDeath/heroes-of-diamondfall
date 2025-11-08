extends Control

@export var hp_speed = 10;

var _unit: Unit;
var unit: Unit:
	get:
		return _unit;
	set(value):
		_unit = value;
		_setup();

func _process(delta: float) -> void:
	if (!unit):
		visible = false;
		return;
	visible = true;
	%HealthBar.value = move_toward(%HealthBar.value, unit.hp, delta * hp_speed);
	%HealthText.text = _format_hp(%HealthBar.value, unit.max_hp);

func _setup() -> void:
	if (!unit): return;
	%Name.text = unit.unit_name;
	%HealthBar.max_value = unit.max_hp;
	%HealthBar.value = unit.hp;
	%HealthText.text = _format_hp(unit.hp, unit.max_hp);
	%BattleSprite.texture = unit.battle_texture;

func _format_hp(value: int, max_value:int) -> String:
	return "%d/%d" % [value, max_value];
