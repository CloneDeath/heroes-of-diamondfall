extends Monster
class_name Wolf

func _init() -> void:
	max_hp = 7;
	strength = 3;
	dexterity = 7;
	gold = randi_range(3, 6);
	battle_texture = preload("res://Units/Monsters/wolf.png")
	super("Wolf");
