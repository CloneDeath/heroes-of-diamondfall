extends HBoxContainer

func _on_applicant_list_item_selected(index: int) -> void:
	var applicant = Heroes.applicants[index];
	$Details.applicant = applicant;
