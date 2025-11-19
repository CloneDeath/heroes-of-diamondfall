extends Node
class_name Inventory

var items: Array[Item];

var weapon: Item;

func equip_weapon(item: Item) -> void:
	if (items.has(item)):
		items.erase(item);
	if (weapon):
		items.push_back(weapon);
	weapon = item;
