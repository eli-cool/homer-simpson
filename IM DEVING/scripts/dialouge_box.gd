extends Node2D


@onready var plr = $"."
var can_speak := false

func _ready() -> void:
	$"Dog-haircut".visible = false
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("+action"):
		if can_speak:
			$"Dog-haircut".visible = not $"Dog-haircut".visible
	pass

func _on_area_2d_area_entered(area: Area2D) -> void:
	print("RAAHHHHH")
	can_speak = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	can_speak = false
	$"Dog-haircut".visible = false
	pass
