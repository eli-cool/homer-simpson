extends CharacterBody2D

@onready var _animated_sprite := $AnimatedSprite2D
@export var speed := 100.0
var walking:bool
var mossy:String = "right"
@export var still := false
@onready var diolouge = $"."


func _physics_process(_delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("left", "right","up","down").normalized()
	var  directionx = direction[0]
	var directiony = direction[1]
	
	velocity = direction * speed
	
	if direction:
		walking = true
	else:
		walking = false
		
	
	if directionx == -1:
		mossy = "left"
	elif directionx == 1:
		mossy = "right"
	elif directiony == 1:
		mossy = "down"
	elif directiony == -1:
		mossy = "up"
	
	if not still:
		move_and_slide()
		anims(mossy)
		
	if diolouge.can_speak:
		if Input.is_action_just_pressed("+action"):
			$"Dog-haircut".visible = not $"Dog-haircut".visible
		else:
			$"Dog-haircut".visible = false


func anims(moss):
	"hi"
	
	if moss == "up":
		if walking:
			_animated_sprite.play("walk_north")
		else:
			_animated_sprite.play("idle_north")
	elif moss == "down":
		if walking:
			_animated_sprite.play("walk_south")
		else:
			_animated_sprite.play("idle_south")
	elif moss == "left":
		if walking:
			_animated_sprite.play("walk_west")
		else:
			_animated_sprite.play("idle_west")
	elif moss == "right":
		if walking:
			_animated_sprite.play("walk_east")
		else:
			_animated_sprite.play("idle_east")
