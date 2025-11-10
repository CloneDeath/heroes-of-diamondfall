extends Node

var heroes: Array[Hero] = [];

func _init() -> void:
	randomize();
	for i in range(3):
		var hero = Hero.new();
		hero.strength = randi_range(1, 3);
		heroes.push_back(hero);
