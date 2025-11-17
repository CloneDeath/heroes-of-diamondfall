extends Control

@export var layout: HorizontalAlignment = HorizontalAlignment.HORIZONTAL_ALIGNMENT_LEFT;
var _units: Array[CombatUnit];
var units: Array[CombatUnit]:
	get: return _units;
	set(value):
		_units = value;
		_reset_units();

var unit_combat_card = preload("res://Adventure/Events/DungeonEvent/unit_combat_card.tscn");
var _unit_width = 150 + 5;
var _unit_height = 135 + 5;
var _unit_count: int = 0;

func _init() -> void:
	for child in get_children():
		child.queue_free();

func _reset_units() -> void:
	for child: Node in get_children():
		if (child is UnitCombatCard):
			child.queue_free();
	_unit_count = 0;
	for unit in _units:
		_add_unit(unit);

func _get_combat_cards() -> Array[UnitCombatCard]:
	return get_children().filter(func (child: Node):
		return child is UnitCombatCard;
	);

func _add_unit(unit: CombatUnit) -> void:
	var card: UnitCombatCard = unit_combat_card.instantiate();
	card.unit = unit;
	var x = floori(_unit_count / 3.0);
	if (layout == HorizontalAlignment.HORIZONTAL_ALIGNMENT_LEFT):
		card.position.x = _unit_width * x;
	else:
		card.position.x = size.x - _unit_width * (x + 1);
		card.anchor_left = 1;
	card.position.y = _unit_height * (_unit_count % 3) + ((x % 2) * _unit_height / 2.0);
	add_child(card);
	_unit_count += 1;
