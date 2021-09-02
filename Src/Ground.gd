extends Node2D

onready var item1 = $Sprite
onready var item2 = $Sprite2
export var scroll_speed = 2

func _ready():
	print(get_viewport().size.x)

func _process(_delta):
	move_bg()

func move_bg():
	item1.position.x -= scroll_speed
	if (item1.position.x <= -get_viewport().size.x):
		item1.position.x = get_viewport().size.x
	item2.position.x -= scroll_speed
	if (item2.position.x <= -get_viewport().size.x):
		item2.position.x = get_viewport().size.x