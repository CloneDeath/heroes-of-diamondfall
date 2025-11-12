extends Node

var heroes: Array[Hero] = [];
var applicants: Array[Applicant] = [];

func _init() -> void:
	randomize();
	for i in range(5):
		var hero = _get_hero();
		var applicant = Applicant.new(hero, 10);
		applicants.push_back(applicant);

func _get_hero() -> Hero:
	var hero = Hero.new();
	hero.max_hp = randi_range(8, 12);
	hero.hp = hero.max_hp;
	hero.strength = randi_range(1, 3);
	return hero;
