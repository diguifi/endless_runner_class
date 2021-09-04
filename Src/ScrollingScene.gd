extends Node2D

onready var item1 = $Sprite
onready var item2 = $Sprite2
export var scroll_speed = 2.0
var player_dead = false

func _ready():
	Signals.connect("kill_player", self, "_kill_player")

func _process(_delta):
	if !player_dead:
		move_bg()

func move_bg():
	item1.position.x -= scroll_speed
	if (item1.position.x <= -get_viewport().size.x):
		item1.position.x = get_viewport().size.x - 1
	item2.position.x -= scroll_speed
	if (item2.position.x <= -get_viewport().size.x):
		item2.position.x = get_viewport().size.x - 1
		
func _kill_player():
	player_dead = true
