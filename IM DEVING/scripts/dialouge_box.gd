extends Node2D


@onready var plr = $"."
@export var can_speak := false

func _on_area_2d_area_entered(area: Area2D) -> void:
	print("RAAHHHHH")
	can_speak = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	can_speak = false
	pass
