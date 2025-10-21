extends Unit
class_name Hero

static var name_generator = NameGenerator.new();
enum Gender {
	male,
	female
};
var gender: Gender;

func _init() -> void:
	super._init();
	var sex = randi_range(0, 100);
	if (sex < 75):
		gender = Gender.male;
	else:
		gender = Gender.female;
	unit_name = name_generator.generate(gender);
