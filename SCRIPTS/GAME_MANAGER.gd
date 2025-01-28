extends Node

@onready var game = preload("res://SCENES/GAME.tscn")

# Score
var score = 0
var highScore = 0

# Volume Control
var VolumeControl

# Mobs Values
var mobMaxHealth = 3
var mobSpeed = 300.00
var spawnRate = 1.0

signal score_updated(new_score)

func add_score(points: int):
	score += points
	emit_signal("score_updated", score)
	
# Function to fix music volume - Not working yet
func setVolume(newVolume):
	VolumeControl = newVolume
	print("Novo Volume = " + str(VolumeControl) + "%")
	pass
