extends Item
class_name Sword

func _init() -> void:
	equipable = EquipSlot.weapon;
	damage = 3;
	super("Sword");
