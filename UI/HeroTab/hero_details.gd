extends VBoxContainer

@export var hero: Hero;

func _process(_delta: float) -> void:
	if (!hero):
		visible = false;
		return;
	visible = true;
	$Name.text = hero.unit_name;
	$Gender.text = _get_gender_text();
	$Health.text = "❤️ " + str(hero.max_hp);
	$Strength.text = "💪 " + str(hero.strength);

func _get_gender_text():
	if (hero.gender == Hero.Gender.male):
		return "♂️ Male";
	else:
		return "♀️ Female";
