extends Node2D

var enemy_count:= 0
const ENEMY00: PackedScene = preload("res://scenes/actors/Enemy00.tscn")


func _on_Timer_timeout():
	#TODO: make static typed
	var enemy = ENEMY00.instance()
	var root = get_tree().get_root()
	var current_scene = root.get_child(root.get_child_count() - 1)
	enemy.set_position(position)
	current_scene.add_child(enemy)


func spawn_start() -> void:
	$Timer.wait_time = 2
	$Timer.start()


func spawn_stop() -> void:
	$Timer.stop()
