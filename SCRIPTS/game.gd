extends Node2D

@onready var player = $Player

func spawn_mob():
	var new_mob = preload("res://SCENES/MOB.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	


func _on_spawn_timer_timeout() -> void:
	spawn_mob()

func _on_player_health_depleted() -> void:
	%GameOver.visible = true
	get_tree().paused = true
	

func _on_restart_pressed() -> void:
	
	get_tree().paused = false
	get_tree().reload_current_scene()	
	GameManager.score = 0

func _on_quit_pressed() -> void:
	get_tree().quit()
	
