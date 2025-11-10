extends Node

var heroes: Array[Hero] = [];

func _init() -> void:
	randomize();
	for i in range(3):
		var hero = Hero.new();
		hero.max_hp = randi_range(8, 12);
		hero.hp = hero.max_hp;
		hero.strength = randi_range(1, 3);
		heroes.push_back(hero);
