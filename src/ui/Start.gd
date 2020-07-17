extends Control

signal start_clicked

var top_score:= 0
var is_start_clicked := false


func _ready():
	$AnimationPlayer.play("default")


func _on_Button_button_up():
	if(top_score == top_score):
		yield(get_tree().create_timer(.2), "timeout")
	if not is_start_clicked:
		emit_signal("start_clicked")
		is_start_clicked = true


func show_replay(score: int) -> void:
	visible = true
	$Button.text = "TAP TO JUMP AGAIN"
	$Button.hide()
	$logo.hide()
	$AnimationPlayer.stop()
	
	if top_score < score:
		top_score = score
		$Title.text = "NEW TOP SCORE"
		$TopScoreValue.text = str(top_score)
		yield(get_tree().create_timer(.2), "timeout")
		$Title.hide()
		yield(get_tree().create_timer(.2), "timeout")
		$Title.show()
		yield(get_tree().create_timer(.2), "timeout")
		$Title.hide()
		yield(get_tree().create_timer(.2), "timeout")
		$Title.show()
	elif top_score == score:
		$Title.text = "ALMOST, YOU GOT THIS"
	else:
		$Title.text = "TRY BETTER NEXT TIME"
	
	yield(get_tree().create_timer(1.6), "timeout")
	$Button.show()
	is_start_clicked = false
