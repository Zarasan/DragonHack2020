extends Node


signal update_hacking_progress

onready var countdown_label = $"Countdown"
onready var player_score = $"Score/PlayerScore"
onready var opponent_score = $"Score/OpponentScore"

onready var rectsize = $".".rect_size 

var PlayerScore = 0
var OpponentScore = 0

func _ready():
	get_tree().call_group('BallGroup','stop_ball')
	pass

func _on_Left_body_entered(body):
	OpponentScore += 1
	score_achieved()

func _on_Right_body_entered(body):
	PlayerScore += 1
	score_achieved()
	$Ball.speed += 50
	$Opponent.speed += 50

func _process(delta):
	player_score.text = str(PlayerScore)
	opponent_score.text = str(OpponentScore)
	countdown_label.text = str(int($CountdownTimer.time_left) + 1)

func _on_CountdownTimer_timeout():
	get_tree().call_group('BallGroup','restart_ball')
	countdown_label.visible = false

func score_achieved():
	if PlayerScore > 2:
		PlayerScore = 0
		OpponentScore = 0
		emit_signal("update_hacking_progress", 15)
		get_tree().call_group('BallGroup','stop_ball')
		$Ball.position = Vector2(295,140)
		$"../Click".visible = true
		return
	if OpponentScore > 2:
		PlayerScore = 0
		OpponentScore = 0
		emit_signal("update_hacking_progress", -10)
		get_tree().call_group('BallGroup','stop_ball')
		$Ball.position = Vector2(295,140)
		$"../Click".visible = true
		return
		
		
	get_tree().call_group('BallGroup','stop_ball')
	$Ball.position = Vector2(295,140)
	
	$CountdownTimer.start()
	countdown_label.visible = true


func _on_Click_pressed():
	$"../Click".visible = false
	$CountdownTimer.start()
	countdown_label.visible = true
	pass # Replace with function body.
