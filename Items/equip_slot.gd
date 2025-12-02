extends Node
class_name EquipSlot;

static var none = EquipSlot.new(0, "none");
static var weapon = EquipSlot.new(1, "Weapon");
static var body = EquipSlot.new(2, "Body");

var id: int;
var slot_name: String;

func _init(id_new: int, name_new: String) -> void:
	id = id_new;
	slot_name = name_new;
	
