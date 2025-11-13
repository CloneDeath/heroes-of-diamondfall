extends Monster
class_name Wolf

func _init() -> void:
	max_hp = 7;
	strength = 3;
	battle_texture = preload("res://Units/Monsters/wolf.png")
	super("Wolf");
