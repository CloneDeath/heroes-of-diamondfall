extends Node

var heroes: Array[Hero] = [];

func _init() -> void:
	randomize();
	for i in range(5):
		heroes.push_back(Hero.new());
