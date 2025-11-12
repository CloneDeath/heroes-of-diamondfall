extends VBoxContainer

@export var applicant: Applicant;

func _process(_delta: float) -> void:
	if (!applicant):
		visible = false;
		return;
	visible = true;
	$Name.text = applicant.unit_name;
	$Gender.text = _get_gender_text();
	$Health.text = "❤️ " + str(applicant.max_hp);
	$Strength.text = "💪 " + str(applicant.strength);
	$Preview.texture = applicant.battle_texture;

func _get_gender_text():
	if (applicant.gender == Hero.Gender.male):
		return "♂️ Male";
	else:
		return "♀️ Female";
