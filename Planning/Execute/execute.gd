extends CenterContainer

func _process(_delta: float) -> void:
	$Execute.disabled = !Dungeons.has_permit();

func _on_execute_pressed() -> void:
	_hero_claim_dungeons();
	get_tree().change_scene_to_file("res://Adventure/adventure.tscn");

func _hero_claim_dungeons() -> void:
	for hero in Heroes.heroes:
		var dungeon = Dungeons.random_purchased();
		HeroAssignment.assign(hero, dungeon);
