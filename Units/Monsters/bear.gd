extends Monster
class_name Bear

func _init() -> void:
	max_hp = 20;
	strength = 5;
	dexterity = 2;
	gold = randi_range(10, 15);
	battle_texture = preload("res://Units/Monsters/bear.png")
	super("Bear");
