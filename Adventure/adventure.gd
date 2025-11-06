extends Control

var dungeon_event = preload("res://Adventure/Events/dungeon_event.tscn");

func _ready() -> void:
	_enqueue_dungeons();
	while ($Queue.has_events()):
		await $Queue.execute();
	_go_back_to_main();

func _go_back_to_main() -> void:
	get_tree().change_scene_to_file("res://UI/main.tscn");

func _enqueue_dungeons() -> void:
	for dungeon in Dungeons.dungeons:
		var heroes = HeroAssignment.get_heroes(dungeon);
		if (heroes.size() == 0): continue;

		var event = dungeon_event.instantiate();
		event.init(dungeon);
		event.visible = false;
		$Queue.add_child(event);
