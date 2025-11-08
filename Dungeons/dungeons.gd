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

func random() -> Dungeon:
	var index = randi_range(0, dungeons.size() - 1);
	return dungeons[index];
