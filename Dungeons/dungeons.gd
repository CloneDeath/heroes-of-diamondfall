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
