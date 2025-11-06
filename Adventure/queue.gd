extends Control

func has_events() -> bool:
	return get_child_count(false) > 0;

func execute():
	var child = get_child(0);
	if child.has_method("execute"):
		child.visible = true;
		await child.execute();
		remove_child(child);
