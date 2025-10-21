extends Node
class_name Room

var monsters: Array[Unit] = [];

func _init(new_monsters: Array[Unit]) -> void:
	monsters = new_monsters;
