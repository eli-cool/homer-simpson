extends AnimatableBody2D

@export var max_speed = 50.0  # Max speed in pixels per second
@export var acceleration = 15.0 # How quickly the object reaches max_speed
@export var friction = 10.0   # How quickly the object slows down
@onready var path_follow: PathFollow2D = get_parent()
@onready var pat
var current_speed = 0.0
var target_speed = 0.0


func _process(delta):
	# Handle input to set the target speed
	handle_input()
	flip_path()
	# Interpolate the current_speed towards the target_speed
	# This creates a smooth acceleration and deceleration effect
	if target_speed > 0:
		current_speed = lerp(current_speed, target_speed, acceleration * delta)
	else:
		current_speed = lerp(current_speed, target_speed, friction * delta)

	# Apply the current speed to the path's progress
	path_follow.progress += current_speed * delta
	
func handle_input():
	# Example: Set target_speed when a key is pressed
	if Input.is_action_pressed("ui_right"):
		target_speed = max_speed
	else:
		target_speed = 0.0
		
func flip_path():
	#hi
	if new_progress_ratio == 0 || new_progress_ratio == 1:
		
