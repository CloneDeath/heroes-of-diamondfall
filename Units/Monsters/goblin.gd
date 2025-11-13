extends Monster
class_name Goblin

func _init() -> void:
	max_hp = 5;
	strength = 1;
	battle_texture = preload("res://Units/Monsters/goblin.png")
	super("Goblin");
