extends ItemList

func _process(_delta: float) -> void:
	var applicants: Array[Applicant] = Heroes.applicants;
	while item_count < applicants.size():
		add_item("New Application");
	while item_count > applicants.size():
		remove_item(0);
	for i in applicants.size():
		var applicant: Applicant = applicants[i];
		set_item_text(i, _get_applicant_text(applicant));

func _get_applicant_text(applicant: Applicant) -> String:
	var result = applicant.unit_name;
	return result;

func get_selected_applicant() -> Applicant:
	var indexes = get_selected_items();
	if indexes.size() == 0: return null;
	var index = indexes[0];
	return Heroes.applicants[index];

func has_selection() -> bool:
	var indexes = get_selected_items();
	return indexes.size() > 0;
