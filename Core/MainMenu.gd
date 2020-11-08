extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var captcha = preload("res://Games/Captcha.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_Start_pressed():
	var cap = captcha.instance()
	add_child(cap)
	get_node("Captcha").connect("game_finished", self, "start_game")
	pass # Replace with function body.

func start_game(_val):
	get_tree().change_scene("res://Core/Core.tscn")

func _on_Exit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_Settings_pressed():
	get_tree().change_scene("res://Core/Settings.tscn")
	pass # Replace with function body.
