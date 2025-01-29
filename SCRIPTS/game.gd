extends Node2D

@onready var player = $Player
# var TimerControl = %Timer.wait_time

func _ready() -> void:
	get_tree().paused = false
	GameManager.score = 0

func spawn_stone():
	var new_stone = preload("res://SCENES/obstacle.tscn").instantiate()
	%DROP_PathFollow2D.progress_ratio = randf()
	new_stone.global_position = %DROP_PathFollow2D.global_position
	add_child(new_stone)

func spawn_mob():
	var new_mob = preload("res://SCENES/MOB.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	
func drop_grass():
	var new_grass = preload("res://SCENES/grass.tscn").instantiate()
	%DROP_PathFollow2D.progress_ratio = randf()
	new_grass.global_position = %DROP_PathFollow2D.global_position
	add_child(new_grass)

func _on_spawn_timer_timeout() -> void:
	spawn_mob()

func _on_player_health_depleted() -> void:
	%GameOver.visible = true
	get_tree().paused = true
	

func _on_restart_pressed() -> void:
	
	get_tree().paused = false
	get_tree().reload_current_scene()	
	GameManager.score = 0

func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/menu.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
	

func _on_drop_spawn_timer_timeout() -> void:
	print("AUTODROP!!!")
	drop_grass()

func _on_timer_timeout() -> void:
	%GameOver.visible = true
	get_tree().paused = true
	
func _on_obstacle_spawn_timer_timeout() -> void:
	print("LIKE A ROLLING STONE!")
	spawn_stone()
	
	
#func setTime():
	#print(str(%Timer.wait_time))
	#TimerControl = newTime
	#%Timer.wait_time = float(TimerControl)
	#print("New Timer = " + str(%Timer.wait_time) + " segundos")
