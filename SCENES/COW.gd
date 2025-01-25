extends CharacterBody2D

@onready var vaca = $AnimatedSprite2D
@onready var shoot_marker = $SHOOTING_AUX
@onready var GameManager = $"res://SCRIPTS/GAME_MANAGER.gd"

var max_health = 100.0
var health = max_health
const SPEED = 300
var facing_direction = Vector2.RIGHT  # Default facing direction

# Trying this function to make the shoot go to the specified direction
func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED
	move_and_slide()
	
	# Update facing direction
	if direction.x > 0:
		facing_direction = Vector2.RIGHT
		vaca.flip_h = false
		shoot_marker.position.x = abs(shoot_marker.position.x)  # Set to the right side
	elif direction.x < 0:
		facing_direction = Vector2.LEFT
		vaca.flip_h = true
		shoot_marker.position.x = -abs(shoot_marker.position.x)  # Set to the left side
	elif direction.y > 0:
		facing_direction = Vector2.DOWN
	elif direction.y < 0:
		facing_direction = Vector2.UP

	# Update animations
	if direction.y < 0:
		vaca.animation = 'BACK_IDLE'
	elif direction == Vector2.ZERO:
		vaca.animation = 'IMPATIENT'
	elif direction.x != 0 or direction.y != 0:
		vaca.animation = 'WALKING'

		
	if Input.is_action_just_pressed("SHOOT"):
		print('atirei')
		shoot()
		
func shoot():
	const BULLET = preload("res://SCENES/milk.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = shoot_marker.global_position
	new_bullet.global_rotation = facing_direction.angle()
	new_bullet.direction = facing_direction
	# FILHO DA PUTA!!!! SEMPRE USA O GET_PARENT CACETE!!!! PERDEU DIAS NESSA BURRICE!!!
	get_parent().add_child(new_bullet)

	
