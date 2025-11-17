extends HBoxContainer

func _on_applicant_list_item_selected(index: int) -> void:
	var applicant = Heroes.applicants[index];
	$Details.applicant = applicant;


func _on_details_applicant_recruited(applicant: Applicant) -> void:
	if (applicant.cost > Resources.gold): return;
	Resources.gold -= applicant.cost;
	applicant.hero.gold += applicant.cost;
	Heroes.heroes.push_back(applicant.hero);
	var index = Heroes.applicants.find_custom(func (other: Applicant):
		return other.hero == applicant.hero;
	);
	if (index < 0): return;
	Heroes.applicants.remove_at(index);
	$Details.applicant = null;
	$ApplicantList.deselect_all();
