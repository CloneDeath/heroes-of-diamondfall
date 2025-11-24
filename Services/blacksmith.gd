extends Service
class_name Blacksmith

class ItemSale:
	var item: Item;
	var cost: int;
	func _init(new_item: Item, new_cost: int) -> void:
		item = new_item;
		cost = new_cost;

var sword = Feature.new("Sword", 10);
func _get_features() -> Array[Feature]:
	return [sword];

func get_items_for_sale() -> Array[ItemSale]:
	var items: Array[ItemSale] = [];
	if (sword.unlocked): items.push_back(ItemSale.new(Sword.new(), 10))
	return items;

func _init() -> void:
	service_name = "Blacksmith";
	cost = 10;
	description = "The Blacksmith creates weapons and armors for your heroes";
	texture = preload("res://Services/blacksmith.png");
	sword.unlocked = true;
