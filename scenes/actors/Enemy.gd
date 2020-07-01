extends Area2D

const SPEED = 256

var motion = Vector2.ZERO
var spawn_position: Vector2 = Vector2.ZERO


func _ready():
	pass


func _process(delta):
	move_local_x(- SPEED * delta)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func set_position(pos: Vector2) -> void:
	position = pos


func _on_Enemy00_body_entered(body):
	if body.is_in_group("players"): #&& body.has_method("kill"):
		print_debug(body)
		body.kill()
