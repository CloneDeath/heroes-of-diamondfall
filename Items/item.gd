extends Node
class_name Item

var item_name: String;
var equipable: EquipSlot = EquipSlot.none;
var damage: int = 0;
var defense: int = 0;

func _init(new_item_name: String) -> void:
	item_name = new_item_name;
