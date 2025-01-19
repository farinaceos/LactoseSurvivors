extends Node2D

@onready var player = $Player

func _on_spawn_timer_timeout():
	print('PEW')
