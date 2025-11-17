@abstract extends Node
class_name Service

var service_name: String;
var description: String;
var cost: int = 0;
var unlocked: bool = false;
var texture: Texture2D;

var features: Array[Feature]:
	get: return _get_features();

@abstract func _get_features() -> Array[Feature];
