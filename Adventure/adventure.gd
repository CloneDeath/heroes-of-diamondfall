extends Control

var rest_event = preload("res://Adventure/Events/RestEvent/rest_event.tscn");
var purchase_event = preload("res://Adventure/Events/PurchaseEvent/purchase_event.tscn");
var dungeon_event = preload("res://Adventure/Events/DungeonEvent/dungeon_event.tscn");

func _ready() -> void:
	_enqueue_purchase();
	_enqueue_dungeons();
	_enqueue_rest();
	while ($Queue.has_events()):
		await $Queue.execute();
	HeroAssignment.clear();
	_go_back_to_main();

func _go_back_to_main() -> void:
	get_tree().change_scene_to_file("res://Planning/main.tscn");

func _enqueue_purchase() -> void:
	var event = purchase_event.instantiate();
	event.visible = false;
	$Queue.add_child(event);

func _enqueue_rest() -> void:
	var unassigned_heroes = Heroes.heroes.filter(func (hero: Hero):
		return !HeroAssignment.is_assigned(hero);
	);
	if (unassigned_heroes.size() == 0):
		return;
	var event = rest_event.instantiate();
	event.init(unassigned_heroes);
	event.visible = false;
	$Queue.add_child(event);

func _enqueue_dungeons() -> void:
	for dungeon in Dungeons.dungeons:
		var heroes = HeroAssignment.get_heroes(dungeon);
		if (heroes.size() == 0): continue;

		var event = dungeon_event.instantiate();
		event.init(dungeon);
		event.visible = false;
		$Queue.add_child(event);
