extends Control

var progress = 0;
@export var time_per_step: float = 2;

func _process(delta: float) -> void:
	progress += delta / time_per_step;
	$ProgressBar.value = progress;
	if (progress >= 1):
		progress = 0;
		_trigger_next_step();

func _trigger_next_step() -> void:
	get_tree().change_scene_to_file("res://UI/main.tscn");
