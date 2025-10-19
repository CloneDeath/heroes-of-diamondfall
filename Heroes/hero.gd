extends Node
class_name Hero

static var name_generator = NameGenerator.new();
enum Gender {
	male,
	female
};
static var next_id: int = 0;

var id: int;
var hero_name: String = "Hero";
var gender: Gender;

var hp: int = 10;
var max_hp: int = 10;

var strength: int = 1;

func _init() -> void:
	id = next_id;
	next_id += 1;
	var sex = randi_range(0, 100);
	if (sex < 75):
		gender = Gender.male;
	else:
		gender = Gender.female;
	hero_name = name_generator.generate(gender);
