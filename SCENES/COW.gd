extends CharacterBody2D

@onready var vaca = $AnimatedSprite2D
@onready var _Area2D = $Area2D

var max_health = 100.0
var health = max_health
const SPEED = 600

func _physics_process(delta):
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = direction * SPEED
	move_and_slide()
		# Flip the Sprite
	if direction[0] > 0:
		vaca.flip_h = false
	elif direction[0] < 0:
		vaca.flip_h = true
	# Not working the Back Idle animation - Work on it!!!
	if direction[1] > 1:
		vaca.animation = 'BACK_IDLE'
		
	# These Animations are fine!
	elif direction[0] == 0 and direction[1] == 0:
		vaca.animation = 'IMPATIENT'
	elif direction[0] != 0:
		vaca.animation = 'WALKING'
		
		
	# Shoot is still coming from a weird place, gotta solve this ASAP
func _on_spawn_timer_timeout():
	_Area2D.shoot()
