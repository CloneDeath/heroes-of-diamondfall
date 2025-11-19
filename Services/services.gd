extends Node

var blacksmith = Blacksmith.new();

var services: Array[Service] = [
	blacksmith,
	Doctor.new()
];
