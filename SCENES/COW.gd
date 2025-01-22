extends CharacterBody2D

@onready var vaca = $AnimatedSprite2D


var idle_timer = 5
var timerToImpatient = 0

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
		
	# PLAY THE CORRECT ANIMATION	
	if direction[1] < 0:
		vaca.animation = 'BACK_WALK'
		# timerToImpatient = 0 # -> TO IMPATIENT
	if velocity.length() > 0.0 and direction[1] >= 0:
		vaca.animation = 'WALKING'
		# timerToImpatient = 0 # -> TO IMPATIENT
	elif velocity.length() == 0.0:
		vaca.animation = 'IDLE'
		# timerToImpatient += delta # -> TO IMPATIENT

# NOT WORKING IMPATIENT ANIMATION
# WILL COME BACK IN THE FUTURE IF HAVE TIME
#	if timerToImpatient >= idle_timer and direction[0] == 0 and direction[1] == 0:
#		vaca.animation = 'IMPATIENT'
			
