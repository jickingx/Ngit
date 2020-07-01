extends Node2D

func start():
	$Sprite.start_scrolling()
	$Sprite2.start_scrolling()

func stop():
	$Sprite.stop_scrolling()
	$Sprite2.stop_scrolling()
