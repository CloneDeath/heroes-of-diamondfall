extends Node

var heroes: Array[Hero] = [];
var applicants: Array[Applicant] = [];
var rejects: Array[Applicant] = [];

func _init() -> void:
	randomize();
	_add_applicants(5);

func refresh_applicants() -> void:
	if (applicants.size() > 8): return;
	_add_applicants(randi_range(1, 5));

func _add_applicants(number: int) -> void:
	for i in range(number):
		var hero = _get_hero();
		var value = (hero.max_hp / 2.0) + hero.strength + (hero.dexterity / 2.0);
		var applicant = Applicant.new(hero, randi_range(value * 0.5, value * 1.5));
		applicants.push_back(applicant);

func _get_hero() -> Hero:
	var hero = Hero.new();
	hero.max_hp = randi_range(8, 15);
	hero.hp = hero.max_hp;
	hero.strength = randi_range(1, 5);
	hero.dexterity = randi_range(1, 5);
	hero.gold = randi_range(0, 3);
	return hero;

func reject(applicant: Applicant) -> void:
	applicants.erase(applicant);
	rejects.push_back(applicant);
