extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal update_hacking_progress

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Terminal_text_entered(new_text):
	$Terminal.text = ""
	print(new_text)
	if "help" in new_text:
		_help()
	if "give_meme" in new_text:
		_give_meme()
	if "clear_terminal" in new_text:
		_clear_terminal()
	if "hack_election" in new_text:
		_hack_election()
	if "pong" in new_text:
		$Print.text +="UP/Down arrows are for movement"
		$Print.newline()



func _help():
	$Print.text += "List of available functions: "
	$Print.newline()
	$Print.text += "help                -   Displays help"
	$Print.newline()
	$Print.text += "pong                -   Displays pong commands"
	$Print.newline()
	$Print.text += "give_meme           -   Sends you a random meme"
	$Print.newline()
	$Print.text += "clear_terminal      -   Clears The Terminal"
	$Print.newline()
	$Print.text += "hack_election   -   Adds a random amount of points to your hacking progress"
	$Print.newline()

func _give_meme():
	var x = randi()%7
	var t=Texture.new()
	t=load("res://Games/terminal/"+ str(x) + ".png")
	$Print.add_image(t,350,350)
	$Print.newline()
	pass

func _clear_terminal():
	$Print.text = ""

func _hack_election():
	get_tree().root.get_child(0).get_node("AudioStreamPlayer").play()
	get_tree().root.get_child(0).get_node("Error1").visible = true
	var t = Timer.new()
	add_child(t)
	t.autostart = true
	t.one_shot = true
	t.start(2)
	t.connect("timeout",self,"other_error")
	pass
	#emit_signal("update_hacking_progress", 5)
	#var t=Texture.new()
	#t=load("res://Games/terminal/election.png")
	#$Print.add_image(t,350,350)
	#$Print.newline()
var second_error = false

func other_error():
	get_tree().root.get_child(0).get_node("Error2").visible = true
	get_tree().root.get_child(0).get_node("AudioStreamPlayer").play()
	second_error = true
	
	


func _on_AudioStreamPlayer_finished():
	if second_error:
		get_tree().quit()
	pass # Replace with function body.
