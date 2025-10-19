extends HBoxContainer

func _process(_delta: float) -> void:
	$GoldValue.text = str(Resources.gold);
