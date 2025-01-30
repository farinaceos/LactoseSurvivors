extends Node2D

@onready var player = $Player
@onready var GameOverTimer = %Timer
# var TimerControl = %Timer.wait_time

func _ready() -> void:
	GameOverTimer.wait_time = GameManager.TimerControl
	get_tree().paused = true
	GameManager.score = 0
	GameOverTimer.start()
	
func spawn_stone():
	var new_stone = preload("res://SCENES/obstacle.tscn").instantiate()
	%DROP_PathFollow2D.progress_ratio = randf()
	new_stone.global_position = %DROP_PathFollow2D.global_position
	add_child(new_stone)

func spawn_mob():
	print(randf())
	if randf() > 0.3:
		var new_mob = preload("res://SCENES/MOB.tscn").instantiate()
		%PathFollow2D.progress_ratio = randf()
		new_mob.global_position = %PathFollow2D.global_position
		add_child(new_mob)
	else:
		var new_mob = preload("res://SCENES/MOB2.tscn").instantiate()
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
	


func _on_continue_pressed() -> void:
	%Pause.visible = false
	if %INSTRUCTIONS.visible:
		%INSTRUCTIONS.visible = false
	get_tree().paused = false
	

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
	
