extends Event

var heroes: Array[Hero];

func init(resting_heroes: Array[Hero]) -> void:
	heroes = resting_heroes;
	for hero: Hero in heroes:
		var label = Label.new();
		label.text = hero.unit_name;
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER;
		$Heroes.add_child(label);
		var amount = randi_range(3, 7);
		hero.heal(amount);

func execute() -> void:
	await get_tree().create_timer(1).timeout;
