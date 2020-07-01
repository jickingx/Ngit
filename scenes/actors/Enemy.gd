extends KinematicBody2D

const TARGET_FPS = 60
const ACCELERATION = 24
const MAX_SPEED = 256

var motion = Vector2.ZERO
var is_disabled:= false
var is_on_screen:= false

var spawn_position: Vector2 = Vector2.ZERO


func _ready():
	#animationPlayer.play("Run")
	pass


func _physics_process(delta):
	if not is_disabled:
		motion.x -= ACCELERATION * delta * TARGET_FPS
		motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED)
		motion = move_and_slide(motion, Vector2.UP)


func _on_VisibilityNotifier2D_screen_entered():
	is_on_screen = true


func _on_VisibilityNotifier2D_screen_exited():
	is_on_screen = false
	is_disabled = true
