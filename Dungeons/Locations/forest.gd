extends Dungeon
class_name Forest

var wolves: Population = Population.new(100);
var bears: Population = Population.new(50);

func _init():
	super("Forest");
	permit_cost = 0;
	difficulty = 1;

func has_monsters() -> bool:
	return wolves.has_population() && bears.has_population();

func _on_kill(unit: Unit):
	if (unit is Wolf):
		wolves.kill();
	if (unit is Bear):
		bears.kill();

func progress() -> float:
	return 1 - ((wolves.current + bears.current) / 150.0);

func get_room() -> Room:
	var monsters: Array[Unit] = [];
	var bear_encounter = randi_range(0, 100) > 50;
	if (progress() > 0.1 && bear_encounter && bears.current >= 1):
		monsters.push_back(Bear.new());

	var max_wolves = 3 - monsters.size();
	if (max_wolves > wolves.current):
		max_wolves = wolves.current;
	var min_wolves = 1 - monsters.size();
	if (min_wolves > wolves.current):
		min_wolves = wolves.current;
	var wolf_count = randi_range(min_wolves, max_wolves);
	for i in range(wolf_count):
		monsters.push_back(Wolf.new());
	return Room.new(monsters);
