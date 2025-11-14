extends VBoxContainer

@export var hero: Hero;

func _process(_delta: float) -> void:
	if (!hero):
		visible = false;
		return;
	visible = true;
	$Name.text = hero.unit_name;
	$Gender.text = _get_gender_text();
	%Health/Current.text = str(hero.hp);
	%Health/Max.text = str(hero.max_hp);
	%Strength.text = "💪 " + str(hero.strength);
	%Dexterity.text = "🏃 " + str(hero.dexterity);
	$Grade.text = "Grade " + hero.grade.display;
	$Preview.texture = hero.battle_texture;
	if (hero.inventory.weapon):
		%Weapon.text = _get_weapon_name(hero.inventory.weapon);
		%Weapon.modulate = Color.WHITE;
	else:
		%Weapon.text = "Fists (+0 damage)";
		%Weapon.modulate = Color.GRAY;

func _get_gender_text():
	if (hero.gender == Hero.Gender.male):
		return "♂️ Male";
	else:
		return "♀️ Female";

func _get_weapon_name(item: Item):
	return item.item_name + " (+" + str(item.damage) + " damage)";
