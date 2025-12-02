extends Node
class_name ItemSale;

var item: Item;
var cost: int;
func _init(new_item: Item, new_cost: int) -> void:
	item = new_item;
	cost = new_cost;
