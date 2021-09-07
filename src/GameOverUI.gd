extends Control

func _ready():
	Signals.connect("game_over", self, "_game_over")
	
func _game_over():
	visible = true

func _on_Button_pressed():
	get_tree().reload_current_scene()
