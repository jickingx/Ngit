extends Node2D

const ENEMY00: PackedScene = preload("res://src/actors/Enemy00.tscn")

var enemy_count:= 0
var enemy_speed_base:= 256.0
var enemy_speed_buff:= 0.0
var enemy_speed_max := 500.0


func spawn_start() -> void:
	$Timer.wait_time = 2
	$Timer.start()


func spawn_stop() -> void:
	$Timer.stop()
	enemy_speed_buff = 0


func _on_Timer_timeout():
	#TODO: make static typed
	var enemy = ENEMY00.instance()
	enemy.set_position(position)
	enemy.speed = enemy_speed_base + enemy_speed_buff
	Global.current_scene.add_child(enemy)
	
	#update buff
	enemy_speed_buff += ((enemy_speed_base + enemy_speed_buff) / 4) / 2 
	enemy_speed_buff = clamp(enemy_speed_buff, 0, enemy_speed_max)
	#print_debug(enemy_speed_buff)
	if enemy_count >= 3 :
		enemy_count = 0
		$Timer.wait_time -= .2
		$Timer.wait_time = clamp($Timer.wait_time, 0 , 1.4)
	else:
		enemy_count += 1
