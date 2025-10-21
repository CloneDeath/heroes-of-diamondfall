extends Node
class_name Unit

var id: int;
var unit_name: String;

var hp: int = 10;
var max_hp: int = 10;

var strength: int = 1;

func _init() -> void:
	id = Id.next();
