extends CharacterBody2D

@onready var player = $"../Player"
@onready var GM = $"/root/GameManager"

const DROP = preload("res://SCENES/grass.tscn")
var health = 2
var drop_rate = 0.7
const SPEED = 100.0
var run = true

func _ready() -> void:
	$AnimatedSprite2D.play("ICE_WALKING")

func _physics_process(delta: float) -> void:
	
	if run:
		var direction = global_position.direction_to(player.global_position)
		velocity = (direction) * SPEED 				#DEBUG USE
		#velocity = (direction * -1) * SPEED 		#GAME USE
		move_and_slide()

func take_damage():
	health -= 1
	$AnimatedSprite2D.play("DAMAGE")
	%AudioStreamPlayer2D.play()
	if health == 0:
		queue_free()
		
func _on_animated_sprite_2d_animation_finished() -> void:
	$AnimatedSprite2D.play("ICE_WALKING")


func _on_tree_exited() -> void:
	GameManager.score += 1
	var drop_chance = randf()
	if drop_chance > drop_rate:
		var new_grass = DROP.instantiate()
		new_grass.global_position = $".".global_position
		player.get_parent().add_child(new_grass)
		print("drop")
