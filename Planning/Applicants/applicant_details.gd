extends VBoxContainer

@export var applicant: Applicant;
signal applicant_recruited(applicant: Applicant);
signal applicant_rejected(applicant: Applicant);

func _process(_delta: float) -> void:
	if (!applicant):
		visible = false;
		return;
	visible = true;
	$Name.text = applicant.unit_name;
	$Gender.text = _get_gender_text();
	$Health.text = "❤️ " + str(applicant.max_hp);
	%Strength.text = "💪 " + str(applicant.strength);
	%Dexterity.text = "🏃 " + str(applicant.dexterity);
	$Preview.texture = applicant.battle_texture;
	$Cost.text = str(applicant.cost) + " Gold";
	$Recruit.disabled = applicant.cost > Resources.gold;

func _get_gender_text():
	if (applicant.gender == Hero.Gender.male):
		return "♂️ Male";
	else:
		return "♀️ Female";

func _on_recruit_pressed() -> void:
	applicant_recruited.emit(applicant);

func _on_reject_pressed() -> void:
	applicant_rejected.emit(applicant);
