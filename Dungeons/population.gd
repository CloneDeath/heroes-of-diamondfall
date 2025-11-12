extends Node
class_name Population

var max_population: int;
var current: int;

func _init(new_max: int) -> void:
	max_population = new_max;
	current = new_max;

func has_population() -> bool:
	return current > 0;

func kill() -> void:
	current -= 1;
	if (current < 0):
		current = 0;
