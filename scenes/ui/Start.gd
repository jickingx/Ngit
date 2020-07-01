extends Control

signal start_clicked

var top_score:= 0

func _on_Button_button_up():
	emit_signal("start_clicked")

func show_replay(score: int) -> void:
	
	visible = true
	$Button.text = "PLAY AGAIN"
	
	if top_score < score:
		top_score = score
		$Title.text = "NEW TOP SCORE"
	elif top_score == score:
		$Title.text = "ALMOST, YOU GOT THIS"
	else:
		$Title.text = "TRY BETTER NEXT TIME"
