extends Service
class_name Blacksmith

var sword = Feature.new("Sword", 10);
var leather_body = Feature.new("Leather Body", 15);

func _get_features() -> Array[Feature]:
	return [sword, leather_body];

func get_items_for_sale() -> Array[ItemSale]:
	var items: Array[ItemSale] = [];
	if (sword.unlocked): items.push_back(ItemSale.new(Sword.new(), 10))
	if (leather_body.unlocked): items.push_back(ItemSale.new(LeatherArmor.new(), 15))
	return items;

func _init() -> void:
	service_name = "Blacksmith";
	cost = 10;
	description = "The Blacksmith creates weapons and armors for your heroes";
	texture = preload("res://Services/blacksmith.png");
	sword.unlocked = true;
