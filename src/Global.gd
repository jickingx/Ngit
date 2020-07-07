extends Node


onready var root = get_tree().get_root()
onready var current_scene = root.get_child(root.get_child_count() - 1)
