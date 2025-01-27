extends Control

func _ready() -> void:
	$VBoxContainer/Button.grab_focus()
	
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/GAME.tscn")

func _on_button_2_pressed() -> void:
	get_tree().quit()
