extends Node2D

const PLAYER: PackedScene = preload("res://scenes/actors/Player.tscn")

var score:= 0
var is_player_active:= false
var is_player_killed:= false


func _on_Start_start_clicked():
	#TODO: make static typed
	var player = PLAYER.instance()
	player.position.y = 0
	player.connect("killed", self, "_on_Player_killed")
	
	#current_scene.add_child(player)
	Global.current_scene.add_child(player)
		
	is_player_killed = false
	score = 0
	$CanvasLayer/Start.hide()
	$CanvasLayer/Score.text = str(score)
	$EnemyManager.spawn_start()


func _on_ScoreArea_area_entered(area: Area2D):
	if not is_player_killed && is_player_active && area.is_in_group("enemies"):
		score += 1
		$CanvasLayer/Score.text = str(score) 


func _on_Player_killed() -> void:
	$Camera2D.shake()
	is_player_active = false
	is_player_killed = true
	$CanvasLayer/Start.show_replay(score)
	$EnemyManager.spawn_stop()
	#EXPLODE PLAYER, SPAWN PARTICLES
	#STOP BK SCROLING


func _on_PlayerDetector_body_entered(body):
	if not is_player_active && body.is_in_group("players"):
		$Camera2D.shake()
		is_player_active = true
		$PlayerDetector/Dust.emitting = true
		#START BK SCROLING
