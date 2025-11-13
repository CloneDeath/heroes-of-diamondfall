extends Node
class_name Unit

signal attacked(damage: int);
signal attacks(target: Unit);

var id: int;
var unit_name: String;
var battle_texture: Texture2D;

var hp: int = 10;
var max_hp: int = 10;

var strength: int = 1;
var dexterity: int = 1;

func _init() -> void:
	id = Id.next();
	hp = max_hp;

func take_damage(amount: int) -> void:
	hp = int(move_toward(hp, 0, amount));
	attacked.emit(amount);

func attack(target: Unit):
	target.take_damage(strength);
	attacks.emit(target);

func get_initiative():
	return randi_range(0, dexterity);
