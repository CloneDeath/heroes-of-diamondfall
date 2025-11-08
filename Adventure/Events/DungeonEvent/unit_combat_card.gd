extends Control
class_name UnitCombatCard

@export var hp_speed = 10;

var _unit: CombatUnit;
var unit: CombatUnit:
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
	if (_unit.hp <= 0):
		modulate = Color.WHITE.lerp(Color.DARK_GRAY, 0.5);

func _setup() -> void:
	if (!unit): return;
	%Name.text = unit.unit_name;
	%HealthBar.max_value = unit.max_hp;
	%HealthBar.value = unit.hp;
	%HealthText.text = _format_hp(unit.hp, unit.max_hp);
	%BattleSprite.texture = unit.battle_texture;

func _format_hp(value: int, max_value:int) -> String:
	return "%d/%d" % [value, max_value];

func attack() -> void:
	var direction: Vector2 = Vector2(20, 0);
	if (unit.team == CombatUnit.Team.monster):
		direction *= -1;
	var t := create_tween();
	t.tween_property(self, "position", position + direction, 0.08);
	t.tween_property(self, "position", position, 0.16);
	await t.finished;
