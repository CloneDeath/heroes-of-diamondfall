extends Node
class_name IdGenerator

static var next_id: int = 0;

func next() -> int:
	var id = next_id;
	next_id += 1;
	return id;
