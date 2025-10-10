extends CharacterBody2D

@onready var player := $"../player"

@export var speed := 50

func _ready():
	add_to_group("enemies", true) # Add the bullet to a group for easier identification
	if is_in_group("enemies"):
		print("whyyyy")
 
func _physics_process(_delta):
	if not player:
		return

	look_at(player.global_position)
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()
