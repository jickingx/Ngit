extends KinematicBody2D

const TARGET_FPS = 60
const GRAVITY = 10
const JUMP_FORCE = 320
const X_POSITION = 96

var motion = Vector2.ZERO

func _physics_process(delta) -> void:
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
