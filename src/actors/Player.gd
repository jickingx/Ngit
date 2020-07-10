class_name Player
extends KinematicBody2D

signal killed

const EXPLOSION: PackedScene = preload("res://src/fx/Explosion.tscn")
const TARGET_FPS = 60
const GRAVITY = 24
const JUMP_FORCE = 576
const X_POSITION = 96

var motion = Vector2.ZERO
var is_disabled:= false  

func _ready()-> void:
	position.x = X_POSITION

func _physics_process(delta) -> void:
	if is_disabled:
		return
	
	motion.y += GRAVITY * delta * TARGET_FPS
	
	if is_on_floor():
		$AnimatedSprite.play("run")
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -JUMP_FORCE
			$AudioStreamPlayer2D.play()
			$AnimatedSprite.play("jump")
	else:
		if(motion.y - get_position().y < 0):
			$AnimatedSprite.play("jump")
		else:
			$AnimatedSprite.play("fall")
	
	motion = move_and_slide(motion, Vector2.UP)


func kill() -> void:
	#TODO: make static typed
	var explosion = EXPLOSION.instance()
	explosion.position = self.position
	Global.current_scene.add_child(explosion)
	explosion.emitting = true
	
	emit_signal("killed")
	queue_free()
