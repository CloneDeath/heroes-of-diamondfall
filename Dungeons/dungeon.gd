@abstract extends Node;
class_name Dungeon;

var id: int;
var dungeon_name: String;
var difficulty: int = 1;

var has_permit: bool = false;
var permit_cost: int = 10;

func _init(new_name: String) -> void:
	id = Id.next();
	dungeon_name = new_name;

func on_complete(room: Room) -> void:
	var defeated = room.monsters.filter(func (other: Unit): return other.hp <= 0);
	for unit: Unit in defeated:
		on_kill(unit);

@abstract func has_monsters() -> bool;
@abstract func on_kill(unit: Unit) -> void;
@abstract func progress() -> float;
@abstract func get_room() -> Room;
