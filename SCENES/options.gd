extends Control

var TimerSelected


# Only thing working right now...
# not very promissing...
# I'll come back tomorrow and try this thing again with a fresh mind
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/menu.tscn")


# Function to get value on slider and send it to GameManager to control Volume
func _on_h_slider_value_changed(value: float) -> void:
	GameManager.VolumeControl = value
	GameManager.setVolume(value)

# Funtions to alter the game timer, not yet working, cant get exactly why
func _on_button_30_pressed() -> void:
	GameManager.setTime()
	#TimerSelected = 30
	#Game.TimerControl = TimerSelected
	#Game.setTime(Game.TimerControl)
#
#func _on_button_45_pressed() -> void:
	#TimerSelected = 45
	##Game.TimerControl = TimerSelected
	#Game.setTime(Game.TimerControl)
