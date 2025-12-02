extends Item
class_name LeatherArmor

func _init() -> void:
	equipable = EquipSlot.body;
	defense = 3;
	super("Leather Armor");
