extends Node
class_name Inventory

var items: Array[Item];

var weapon: Item;
var body: Item;

func equip_weapon(item: Item) -> void:
	if (items.has(item)):
		items.erase(item);
	if (weapon):
		items.push_back(weapon);
	weapon = item;

func equip_body(item: Item) -> void:
	if (items.has(item)):
		items.erase(item);
	if (body):
		items.push_back(body);
	body = item;
