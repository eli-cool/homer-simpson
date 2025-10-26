extends Sprite2D


@export var speed = 40
@export var dissapear_speed = 2


func _physics_process(delta):
	position += transform.x * speed * delta
	await get_tree().create_timer(0.3).timeout
	diss(delta)
	
func diss(delta):
	modulate.a -= dissapear_speed * delta
	if modulate.a <= 0:
		queue_free()
