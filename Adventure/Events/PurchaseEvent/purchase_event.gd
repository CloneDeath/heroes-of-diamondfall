extends Event

@abstract class Purchase:
	var item: ItemSale = null;
	var current: Item;
	func _init(n_current: Item) -> void:
		current = n_current;
	@abstract func consider(sale: ItemSale) -> void;
	@abstract func try_buy(hero: Hero) -> ItemSale;
	func _get_best() -> Item:
		if (item): return item.item;
		return current;

class WeaponPurchase extends Purchase:
	func consider(sale: ItemSale) -> void:
		if (sale.item.equipable != EquipSlot.weapon): return;
		var best = _get_best();
		if (best == null || sale.item.damage > best.damage):
			item = sale;
	func try_buy(hero: Hero) -> ItemSale:
		if (!item || item.cost > hero.gold): return null;
		hero.gold -= item.cost;
		hero.inventory.equip_weapon(item.item);
		return item;
			
class BodyPurchase extends Purchase:
	func consider(sale: ItemSale) -> void:
		if (sale.item.equipable != EquipSlot.body): return;
		var best = _get_best();
		if (best == null || sale.item.damage > best.damage):
			item = sale;
	func try_buy(hero: Hero) -> ItemSale:
		if (!item || item.cost > hero.gold): return null;
		hero.gold -= item.cost;
		hero.inventory.equip_body(item.item);
		return item;

func execute() -> void:
	for hero in Heroes.heroes:
		var purchases = _buy_items(hero);
		await _document_purchases(hero, purchases);

func _wait_one() -> void:
	await get_tree().create_timer(0.5).timeout;

func _buy_items(hero: Hero) -> Array[ItemSale]:
	if (!Services.blacksmith.unlocked):
		return [];
	var affordable: Array[ItemSale] = Services.blacksmith.get_items_for_sale()\
		.filter(func (sale: ItemSale) -> bool: return sale.cost <= hero.gold);
	
	var purchases: Array[Purchase] = [
		WeaponPurchase.new(hero.inventory.weapon),
		BodyPurchase.new(hero.inventory.body)
	];
	
	for sale in affordable:
		for purchase in purchases:
			purchase.consider(sale);
	
	var bought: Array[ItemSale] = [];
	for purchase in purchases:
		var item = purchase.try_buy(hero);
		if (item):
			bought.push_back(item);
	return bought;

func _document_purchases(hero: Hero, purchases: Array[ItemSale]) -> void:
	for purchase in purchases:
		var label = Label.new();
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER;
		label.text = hero.unit_name + " purchased a " \
			+ purchase.item.item_name + " for " + str(purchase.cost) + " gold";
		$Purchases.add_child(label);
		await _wait_one();
