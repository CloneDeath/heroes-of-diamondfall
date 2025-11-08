extends Control

@export var layout: HorizontalAlignment = HorizontalAlignment.HORIZONTAL_ALIGNMENT_LEFT;

var unit_combat_card = preload("res://Adventure/Events/DungeonEvent/unit_combat_card.tscn");
var _unit_width = 150 + 5;
var _unit_height = 135 + 5;
var _unit_count: int = 0;

func _init() -> void:
	for child in get_children():
		child.queue_free();

func add_unit(unit: Unit) -> void:
	var card: UnitCombatCard = unit_combat_card.instantiate();
	card.unit = unit;
	if (layout == HorizontalAlignment.HORIZONTAL_ALIGNMENT_LEFT):
		card.position.x = _unit_width * floori(_unit_count / 3.0);
	else:
		card.position.x = size.x - _unit_width * (floori(_unit_count / 3.0) + 1);
		card.anchor_left = 1;
	card.position.y = _unit_height * (_unit_count % 3);
	add_child(card);
	_unit_count += 1;
