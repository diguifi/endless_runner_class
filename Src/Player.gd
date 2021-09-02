extends KinematicBody2D

export var gravity = 10
var velocity = Vector2.ZERO

func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	#apply_state()
	if velocity.y < 1000:
		velocity.y += gravity
		
	var _collision = move_and_collide(velocity*delta)