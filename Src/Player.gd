extends KinematicBody2D

enum states_enum {
	JUMP,
	JUMPIDLE,
	RUN,
	DEAD,
}
onready var animation = $AnimatedSprite
export var gravity = 10
var velocity = Vector2.ZERO
var jump_velocity = 350
var on_floor = false
var state = states_enum.RUN

func _ready():
	Signals.connect("kill_player", self, "_player_hit")

func _physics_process(delta):
	apply_state()
	if velocity.y < 1000:
		velocity.y += gravity
		
	var collision = move_and_collide(velocity*delta)
	on_floor = collision != null

func _input(event):
	if on_floor && state == states_enum.RUN:
		if event.is_action_pressed("Jump"):
			change_state(states_enum.JUMP)

func change_state(new_state):
	if (state != states_enum.DEAD):
		state = new_state

func apply_state():
	match state:
		states_enum.RUN:
			animation.play("default")
		states_enum.JUMP:
			velocity = Vector2.ZERO
			velocity.y -= jump_velocity
			animation.play("jump")
			state = states_enum.JUMPIDLE
		states_enum.DEAD:
			animation.play("die")
		states_enum.JUMPIDLE:
			if on_floor:
				state = states_enum.RUN
				
				
func _player_hit():
	change_state(states_enum.DEAD)


func _on_AnimatedSprite_animation_finished():
	if animation.animation == "die":
		Signals.emit_signal("game_over")
