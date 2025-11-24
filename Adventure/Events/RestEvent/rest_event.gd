extends Event

var heroes: Array[Hero];

func init(resting_heroes: Array[Hero]) -> void:
	heroes = resting_heroes;

func execute() -> void:
	await _wait_one();
	for hero: Hero in heroes:
		var before = hero.hp;
		var amount = randi_range(10, 20);
		hero.heal(amount);
		var after = hero.hp;

		var healed = after - before;
		var label = Label.new();
		label.text = hero.unit_name + " +" + str(healed) +\
			"HP (" + str(hero.hp) + "/" + str(hero.max_hp) + ")";
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER;
		$Heroes.add_child(label);
		await _wait_one();
	await _wait_one();

func _wait_one() -> void:
	await get_tree().create_timer(1).timeout;
