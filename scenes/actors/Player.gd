class_name Player
extends KinematicBody2D

signal killed

const TARGET_FPS = 60
const GRAVITY = 12
const JUMP_FORCE = 384
const X_POSITION = 96

var motion = Vector2.ZERO
var is_disabled:= false  

func _ready()-> void:
	position.x = X_POSITION

func _physics_process(delta) -> void:
	if is_disabled:
		return
	
	#animationPlayer.play("Run")
	motion.y += GRAVITY * delta * TARGET_FPS
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -JUMP_FORCE
	else:
		pass
		#animationPlayer.play("Run")
		#if(motion.y - get_position().y < 0):
			#$AnimatedSprite.play("JumpUp")
		#else:
			#$AnimatedSprite.play("JumpDown")
	
	motion = move_and_slide(motion, Vector2.UP)


func kill() -> void:
	emit_signal("killed")
	queue_free()
