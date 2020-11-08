extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var progress = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$"Hacking Screen".connect("update_hacking_progress",self, "updated_progress")
	pass # Replace with function body.


func updated_progress(_progress):
	$Lock.visible = false
	progress += _progress
	
	if progress > 20:
		$"Control/TextureRect".modulate = Color("00ff6e")
	if progress > 40:
		$"Control/TextureRect2".modulate = Color("00ff6e")
	if progress > 60:
		$"Control/TextureRect3".modulate = Color("00ff6e")
	if progress > 80:
		$"Control/TextureRect4".modulate = Color("00ff6e")
	if progress > 100:
		$"Control/TextureRect5".modulate = Color("00ff6e")
		finish()

func finish():
	$Error1.visible = true
	print("test")


func _on_Quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
