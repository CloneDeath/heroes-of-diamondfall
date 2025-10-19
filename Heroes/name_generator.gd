extends Node

class_name NameGenerator

const MALE_NAMES: Array[String] = [
	"Nicholas", "Nico",
	"Arin", "Tobias", "Doran", "Soren", "Kael", "Eldric", "Theron", "Corin", "Fenric", "Torin",
	"Aldrin", "Gareth", "Orin", "Varyn", "Malric", "Draven", "Thalor", "Korin", "Fendric", "Vael",
	"Ronan", "Jareth", "Talon", "Riven", "Varen", "Kaelen", "Alen", "Erynd", "Toriel", "Maric",
	"Vaylen", "Kelyn", "Rylan", "Kelric", "Doranth", "Rorin", "Eiran", "Torvik", "Valen", "Thalen",
	"Arion", "Kareth", "Eldan", "Ravik", "Aurin", "Velric", "Torvin", "Nyric", "Auren", "Dareth",
	"Isran", "Valric", "Kaen", "Myric", "Viren", "Eldric", "Aleron", "Sylric", "Torric", "Ressan",
	"Kaelir", "Tirian", "Velis", "Corric", "Vaelor", "Thalric", "Nalin", "Kyris", "Tessan", "Rynric",
	"Aelric", "Dorin", "Torrin", "Calen", "Torric", "Elandra", "Thyric", "Tarin", "Elric", "Isric",
	"Aurin", "Vyrin", "Torran", "Eiran", "Darin", "Korric", "Rynel", "Sorin", "Thyren", "Torin",
	"Kaelis", "Corric", "Torren", "Nerun", "Eldros", "Ravon", "Myric", "Kaelor", "Tharic", "Loryn"
];

const FEMALE_NAMES: Array[String] = [
	"Naomi", "Mimi",
	"Lira", "Kira", "Mira", "Lyra", "Seren", "Nivra", "Isolde", "Eira", "Nyra", "Celra",
	"Elara", "Selene", "Kaida", "Ilyra", "Liora", "Nerra", "Tessa", "Zara", "Nira", "Serra",
	"Riona", "Aeris", "Nyssa", "Daria", "Tirra", "Alyndra", "Fenra", "Viona", "Thessa", "Myra",
	"Sira", "Nirael", "Vynra", "Soriel", "Tessra", "Nalara", "Corra", "Eisra", "Mirael", "Kaelia",
	"Sereth", "Lirra", "Fenra", "Thyra", "Coriel", "Erya", "Liora", "Nessra", "Taryn", "Kessa",
	"Varra", "Fayra", "Maren", "Serin", "Eryndra", "Isren", "Liora", "Malra", "Fenra", "Nyris",
	"Velra", "Eisra", "Syrin", "Valra", "Kaelra", "Elandra", "Myrin", "Ravra", "Neren", "Vayra",
	"Lerra", "Seran", "Nesra", "Myrra", "Aelra", "Eldra", "Tessa", "Nirra", "Lirra", "Myra",
	"Nerra", "Eiren", "Sylra", "Thyra", "Mira", "Seren", "Kaela", "Tirra", "Lynra", "Vaelra",
	"Edris", "Kisra", "Loriel", "Naera", "Sylra", "Vionne", "Lyssra", "Thylen", "Meris", "Rynra"
];

const NEUTRAL_NAMES: Array[String] = [
	"Dylan",
	"Aris", "Lior", "Ryn", "Eris", "Vael", "Taren", "Nerin", "Corraen", "Miraen", "Kaenra",
	"Thalen", "Lioraen", "Varen", "Seren", "Nyric", "Auren", "Isen", "Valen", "Torrin", "Eiren",
	"Sorin", "Lirraen", "Rynra", "Kaelis", "Nessa"
];

func generate(gender: Hero.Gender) -> String:
	var first_name = _get_first_name(gender);

	var has_last_name = randi_range(0, 100) < 95;
	if (!has_last_name):
		return first_name;

	var last_name = _get_last_name();
	return "%s %s" % [first_name, last_name];

func _get_first_name(gender: Hero.Gender) -> String:
	var category:Array[String];
	var category_chance = randi_range(0, 100);
	if category_chance < 90:
		category = _get_gender_array(gender);
	else:
		category = NEUTRAL_NAMES;
	return category[randi() % category.size()];

func _get_gender_array(gender: Hero.Gender) -> Array[String]:
	if (gender == Hero.Gender.male):
		return MALE_NAMES;
	else:
		return FEMALE_NAMES;

const LAST_NAME_START: Array[String] = [
	"Rod", "Red",
	"Storm", "Rain", "Cloud", "Sun", "Wind", "Horizon", "Ever", "Glade",
	"Ash", "Fire", "Pyre", "Simmer", "Haze",
	"River", "Hill", "Valley", "Farm", "Steep",
	"Dawn", "Dusk", "Night", "Day", "Twilight",
	"Iron", "Wood", "Dirt", "Mud", "Timber", "Copper", "Smith", "Bronze"
];
const LAST_NAME_END: Array[String] = [
	"ine", "field",
	"born", "vale", "crest", "wood", "bloom", "ling", "ing", "son", "der",
	"crom", "dire", "stem", "wander", "vander", "vader", "belt", "grove", "way",
	"smith", "mage", "age", "ith", "ish", "er", "fare", "stein", "stine",
	"watch"
];
func _get_last_name():
	var base_name = LAST_NAME_START[randi() % LAST_NAME_START.size()];
	var has_simple_name = randi_range(0, 100) > 90;
	if (has_simple_name):
		return base_name;

	var ending = LAST_NAME_END[randi() % LAST_NAME_END.size()];
	return "%s%s" % [base_name, ending];
