extends AnimatableBody2D


@export var move_speed = 0.2
@onready var knight = $knight
@onready var path_follow: PathFollow2D = get_parent()




var path_direction = 1

func _physics_process(_delta):
	path_follow.progress += move_speed * path_direction
	var new_progress_ratio = path_follow.progress_ratio
	if new_progress_ratio == 0 || new_progress_ratio == 1:
		path_direction *= -1
		
