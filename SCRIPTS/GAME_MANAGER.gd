extends Node

@onready var game = preload("res://SCENES/game.tscn")

# Score
var score = 0
var highScore = 0
var Version = "V gj1.0" #Just a Gimmick to center versions =)
# Volume Control
var VolumeControl

# TIMER CONTROL LETS TRY!
var TimerControl = 60 #Standard
# Comment, IT FRICKING WORKED!!!

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
	AudioServer.set_bus_volume_db(0,newVolume/4 - 20)
	VolumeControl = newVolume
	print("Novo Volume = " + str(AudioServer.get_bus_volume_db(0)) + "%")
	
func setTime(newTimer):
	TimerControl = newTimer
	print("Novo Timer = " + str(TimerControl))

func muteVolume(toggled_on):
	AudioServer.set_bus_mute(0,toggled_on)
	print("MUTE IS "+ str(toggled_on))
