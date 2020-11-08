extends Control

var like_a_machine = preload("res://Games/Captcha/audio/like-a-machine.ogg")

signal game_finished
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(Array) var test

var count = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize_game_pictures()
	pass # Replace with function body.

func randomize_game_pictures():
	pass


func _on_Iamnotarobot_pressed():
	if check_active() == 4:
		#$like_a_machine.play()
		$Timer.start()
	else:
		$Iamnotarobot.pressed = false
		print("wrong")
	count = 0
	pass # Replace with function body.


func check_active():
	if $"GridContainer/Button1".pressed == true:
		count += 1
	if $"GridContainer/Button4".pressed == true:
		count += 1
	if $"GridContainer/Button5".pressed == true:
		count += 1
	if $"GridContainer/Button8".pressed == true:
		count += 1
	
	return count


func _on_Button_toggled(_toggled, _button_clicked):
	if _button_clicked == "Button5":
		$purebread.play()
	find_node(_button_clicked).get_child(1).pressed = _toggled
	pass # Replace with function body.


func _on_Timer_timeout():
	emit_signal("game_finished", 15)
	pass # Replace with function body.
