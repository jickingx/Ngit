extends Node2D

const PLAYER: PackedScene = preload("res://scenes/actors/Player.tscn")

var score:= 0
var is_player_killed:= false
onready var root = get_tree().get_root()
onready var current_scene = root.get_child(root.get_child_count() - 1)


func _on_Start_start_clicked():
	#TODO: make static typed
	var player = PLAYER.instance()
	player.position.y = 0
	player.connect("killed", self, "_on_Player_killed")
	
	current_scene.add_child(player)
	
	is_player_killed = false
	score = 0
	$CanvasLayer/Start.hide()
	$EnemyManager.spawn_start()


func _on_ScoreArea_area_entered(area: Area2D):
	if not is_player_killed && area.is_in_group("enemies"):
		score += 1
		$CanvasLayer/Score.text = str(score) 


func _on_Player_killed() -> void:
	ShakeCamera.shake()
	is_player_killed = true
	$CanvasLayer/Start.show_replay(score)
	$EnemyManager.spawn_stop()

