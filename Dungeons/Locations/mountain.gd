extends Dungeon
class_name Mountain;

var orcs: Population = Population.new(100);
var goblins: Population = Population.new(500);

func _init():
	super("Mountain");
	permit_cost = 0;
	difficulty = 2;

func has_monsters() -> bool:
	return orcs.has_population() && goblins.has_population();

func on_kill(unit: Unit):
	if (unit is Orc):
		orcs.kill();
	if (unit is Goblin):
		goblins.kill();

func progress() -> float:
	return 1 - ((orcs.current + goblins.current) / 600.0);

func get_room() -> Room:
	var monsters: Array[Unit] = [];
	var orc_encounter = randi_range(0, 100) > 80;
	if (orc_encounter && orcs.current > 1):
		monsters.push_back(Orc.new());

	var max_goblins = 5;
	var min_goblins = 1;
	if (max_goblins > goblins.current):
		max_goblins = goblins.current;
	if (min_goblins > goblins.current):
		min_goblins = goblins.current;
	var golbin_count = randi_range(min_goblins, max_goblins);
	for i in range(golbin_count):
		monsters.push_back(Goblin.new());
	return Room.new(monsters);
