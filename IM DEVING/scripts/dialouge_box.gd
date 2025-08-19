extends Node2D


@onready var plr = $"."

	


func _ready() -> void:
	$"Dog-haircut".visible = not $"Dog-haircut".visible


func _on_area_2d_area_entered(area: Area2D) -> void:
	print("RAAHHHHH")
	$"Dog-haircut".visible = not $"Dog-haircut".visible
	
