extends Node2D

export var scroll_speed = 2

func _physics_process(_delta):
	_move()

func _move():
	position.x -= scroll_speed
	if position.x < -24:
		queue_free()
