extends Event

func execute() -> void:
	for hero in Heroes.heroes:
		var purchase = _buy_items(hero);
		if (purchase):
			await _wait_one();
			_document_purchase(hero, purchase);
			await _wait_one();
		pass;

func _wait_one() -> void:
	await get_tree().create_timer(0.5).timeout;

func _buy_items(hero: Hero) -> Blacksmith.ItemSale:
	if (hero.inventory.weapon):
		return null;
	var purchase: Blacksmith.ItemSale = null;
	var best = hero.inventory.weapon;
	for sale in Services.blacksmith.get_items_for_sale():
		if (sale.cost > hero.gold): continue;
		if (sale.item.damage > best.damage):
			best = sale.item;
			purchase = sale;
	if (purchase):
		hero.gold -= purchase.cost;
		hero.inventory.equip_weapon(purchase.item);
	return purchase;

func _document_purchase(hero: Hero, purchase: Blacksmith.ItemSale) -> void:
	var label = Label.new();
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER;
	label.text = hero.unit_name + " purchased a " + purchase.item.item_name + \
		" for " + str(purchase.cost) + " gold";
	$Purchases.add_child(label);
