extends Node
class_name Unit

signal attacked(damage: int);
signal attacks(target: Unit);
signal death(unit: Unit);

var id: int;
var unit_name: String;
var battle_texture: Texture2D;

var hp: int = 10;
var max_hp: int = 10;
var dead: bool = false;

var strength: int = 1;
var dexterity: int = 1;

var gold: int = 0;

var inventory: Inventory = Inventory.new();

func _init() -> void:
	id = Id.next();
	hp = max_hp;

func heal(amount: int) -> void:
	hp = int(move_toward(hp, max_hp, amount));
	if (hp > 0):
		dead = false;

func take_damage(amount: int) -> void:
	var damage = amount;
	if (inventory.body):
		damage -= inventory.body.defense;
	if (damage <= 0):
		damage = 1;
	if (hp > 0):
		hp = int(move_toward(hp, 0, damage));
		attacked.emit(damage);
	if (hp <= 0 && !dead):
		dead = true;
		death.emit(self);

func attack(target: Unit):
	var damage = strength;
	if (inventory.weapon):
		damage += inventory.weapon.damage;
	target.take_damage(damage);
	attacks.emit(target);

func get_initiative():
	return randi_range(0, dexterity);
