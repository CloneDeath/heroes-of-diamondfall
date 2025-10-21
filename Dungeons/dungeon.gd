extends Node
class_name Dungeon

var id: int;
var dungeon_name: String;
var rooms: Array[Room];

func _init(new_name: String, new_rooms: Array[Room]) -> void:
	id = Id.next();
	dungeon_name = new_name;
	rooms = new_rooms;
