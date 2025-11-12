extends Node
class_name Dungeon

var id: int;
var dungeon_name: String;
var rooms: Array[Room];

var has_permit: bool = false;
var permit_cost: int = 10;

func _init(new_name: String, new_rooms: Array[Room]) -> void:
	id = Id.next();
	dungeon_name = new_name;
	rooms = new_rooms;
