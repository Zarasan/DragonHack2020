extends Control

signal update_hacking_progress
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var captcha = preload("res://Games/Captcha.tscn")
onready var pong = preload("res://Games/Pong.tscn")
var game_count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func next_game(_game):
	$".".visible = true
	if get_child_count() < 1:
		var _current_game = _game.instance()
		add_child(_current_game)
		get_child(0).connect("game_finished", self, "update_score")

func update_score(points):
	$"../Game3/ColorRect/Label".text = "You are not a robot!"
	$"../Game3".disabled = true
	$".".visible = false
	get_child(0).disconnect("game_finished", self, "update_score")
	get_child(0).queue_free()
	remove_child(get_child(0))
	emit_signal("update_hacking_progress", points)


func _on_Game_pressed(_game):
	match _game:
		"Pong":
			next_game(pong)
		"Captcha":
			next_game(captcha)
	
	pass # Replace with function body.
