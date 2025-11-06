extends Event
class_name DungeonEvent

var _dungeon: Dungeon;

var process = false;
var progress = 0;
@export var time_per_step: float = 2;
signal _progress_complete;

func init(dungeon: Dungeon) -> void:
	_dungeon = dungeon;
	$DungeonName.text = dungeon.dungeon_name;

func _process(delta: float) -> void:
	if (!process): return;

	progress += delta / time_per_step;
	$ProgressBar.value = progress;
	if (progress >= 1):
		progress = 0;
		_progress_complete.emit();

func execute() -> void:
	process = true;
	await _progress_complete;
