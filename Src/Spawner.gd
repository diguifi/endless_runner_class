extends Node2D

export (Array, PackedScene) var obstacles = []
export var spawn_chance = 70
var player_dead = false
var randomizer = RandomNumberGenerator.new()

func _ready():
	Signals.connect("kill_player", self, "_player_hit")
	
func spawn_obstacle():
	randomizer.randomize()
	var spawn_probability = randomizer.randi_range(0, 100)
	if spawn_probability <= spawn_chance:
		var temp = obstacles[0].instance()
		add_child_below_node(self, temp)

func _on_Timer_timeout():
	if !player_dead:
		spawn_obstacle()
	
func _player_hit():
	player_dead = true
