extends Node

var dungeons: Array[Dungeon] = [
	Dungeon.new("Forest", [
		Room.new([Wolf.new()]),
		Room.new([Bear.new()])
	]),
	Dungeon.new("Mountain", [
		Room.new([Goblin.new()]),
		Room.new([Orc.new(), Goblin.new()])
	])
];

func get_dungeon(id: int) -> Dungeon:
	var get_by_id = func(dungeon: Dungeon):
		return dungeon.id == id;
	var index = dungeons.find_custom(get_by_id);
	return dungeons[index];

func has_permit() -> bool:
	var purchased = dungeons.filter(func (dungeon: Dungeon): return dungeon.has_permit);
	return purchased.size() > 0;

func random_purchased() -> Dungeon:
	var purchased = dungeons.filter(func (dungeon: Dungeon): return dungeon.has_permit);
	var index = randi_range(0, purchased.size() - 1);
	return purchased[index];
