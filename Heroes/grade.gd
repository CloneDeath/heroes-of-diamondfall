extends Node
class_name Grade;

static var a := Grade.new(5, "🇦");
static var b := Grade.new(4, "🇧");
static var c := Grade.new(3, "🇨");
static var d := Grade.new(2, "🇩");
static var e := Grade.new(1, "🇪");

var _value: int;
var _display: String;

var display:
	get: return _display;

func _init(value: int, display_text: String) -> void:
	_value = value;
	_display = display_text;
