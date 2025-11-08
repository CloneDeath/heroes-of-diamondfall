extends Unit
class_name Hero

var male_sprite = preload("res://Heroes/hero.png");
var female_sprite = preload("res://Heroes/hero_female.png");

static var name_generator = NameGenerator.new();
enum Gender {
	male,
	female
};

var gender: Gender;
var grade: Grade = Grade.e;

func _init() -> void:
	super._init();
	var sex = randi_range(0, 100);
	if (sex < 75):
		gender = Gender.male;
		battle_texture = male_sprite;
	else:
		gender = Gender.female;
		battle_texture = female_sprite;
	unit_name = name_generator.generate(gender);
