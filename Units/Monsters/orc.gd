extends Monster
class_name Orc

func _init() -> void:
	max_hp = 30;
	strength = 7;
	dexterity = 5;
	gold = randi_range(7, 15);
	battle_texture = preload("res://Units/Monsters/orc.png")
	super("Orc");
