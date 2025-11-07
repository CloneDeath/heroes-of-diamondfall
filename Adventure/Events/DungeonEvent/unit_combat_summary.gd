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
	$Health.value = move_toward($Health.value, unit.hp, delta * hp_speed);

func _setup() -> void:
	if (!unit): return;
	$Name.text = unit.unit_name;
	$Health.max_value = unit.max_hp;
	$Health.value = unit.hp;
