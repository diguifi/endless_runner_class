extends Node2D

export var scroll_speed = 2
var player_dead = false

func _ready():
	Signals.connect("kill_player", self, "_kill_player")

func _physics_process(_delta):
	if !player_dead:
		_move()

func _move():
	global_position.x -= scroll_speed
	if global_position.x < -24:
		queue_free()

func _on_Damage_body_entered(body):
	if body.name == "Player":
		Signals.emit_signal("kill_player")

func _kill_player():
	player_dead = true
