extends CharacterBody2D

@onready var CowPlaceholder = $CowPlaceholder

var max_health = 100.0
var health = max_health
const SPEED = 600

func _physics_process(_delta):
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = direction * SPEED
	move_and_slide()
	print(direction[0])
		# Flip the Sprite
	if direction[0] > 0:
		CowPlaceholder.flip_h = true
	elif direction[0] < 0:
		CowPlaceholder.flip_h = false
