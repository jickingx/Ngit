extends Sprite

const VELOCITY: float = -3.0
var g_texture_width: float = 0
var is_scrolling:= false

func _ready():
	g_texture_width = texture.get_size().x * scale.x

func _process(delta: float) -> void:
	if is_scrolling:
		position.x += VELOCITY
		_attempt_reposition()

func _attempt_reposition() -> void:
	if position.x < -g_texture_width:
		position.x += 2 * g_texture_width


func start_scrolling():
	is_scrolling = true


func stop_scrolling():
	is_scrolling = false
