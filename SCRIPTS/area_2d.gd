extends Area2D

# YOL's aiming function -> Using lambda to always aim the closest mobs


func shoot():
	const BULLET = preload("res://SCENES/milk.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = $"..".global_position
	new_bullet.global_rotation = $"..".global_rotation
	$"..".add_child(new_bullet)	
