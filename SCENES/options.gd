extends Control

# Function to get value on slider and send it to GameManager to control Volume
func _on_h_slider_value_changed(value: float) -> void:
	GameManager.VolumeControl = value
	GameManager.setVolume(value)

# Funtions to alter the game timer
func _on_button_30_pressed() -> void:
	GameManager.setTime(30)
func _on_button_45_pressed() -> void:
	GameManager.setTime(45)
func _on_button_60_pressed() -> void:
	GameManager.setTime(60)
func _on_button_90_pressed() -> void:
	GameManager.setTime(90)

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/menu.tscn")
	
func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/credits.tscn")

func _on_check_box_toggled(toggled_on: bool) -> void:
	GameManager.muteVolume(toggled_on)
