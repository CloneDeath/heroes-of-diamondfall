extends Node

var goblin: Unit = Monster.new("Goblin")

var dungeons: Array[Dungeon] = [
	Dungeon.new("Forest", [
		Room.new([goblin])
	]),
	Dungeon.new("Mountain", [
		Room.new([goblin]),
		Room.new([goblin, goblin])
	])
];

func get_dungeon(id: int) -> Dungeon:
	var get_by_id = func(dungeon: Dungeon):
		return dungeon.id == id;
	var index = dungeons.find_custom(get_by_id);
	return dungeons[index];
