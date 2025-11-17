extends Node
class_name Feature

@export var unlocked: bool = false;
@export var cost: int = 10;

func _init(new_name: String, new_cost: int) -> void:
	name = new_name;
	cost = new_cost;
