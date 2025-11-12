extends Node
class_name Applicant;

var hero: Hero;
var cost: int;

var unit_name: String:
	get: return hero.unit_name;
var max_hp: int:
	get: return hero.max_hp;
var strength: int:
	get: return hero.strength;
var battle_texture: Texture2D:
	get: return hero.battle_texture;
var gender: Hero.Gender:
	get: return hero.gender;

func _init(new_hero, new_cost) -> void:
	hero = new_hero;
	cost = new_cost;
