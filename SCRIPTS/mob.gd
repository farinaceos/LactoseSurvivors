extends CharacterBody2D

@onready var player = $"../Player"
@onready var GM = $"/root/GameManager"

var health = 3
var drop_rate = 0.8
const SPEED = 100.0
var run = false

func _physics_process(delta: float) -> void:
	print(run)
	if run:
		var direction = global_position.direction_to(player.global_position)
		#velocity = (direction) * SPEED 				#DEBUG USE
		velocity = (direction * -1) * SPEED 		#GAME USE
		move_and_slide()

func take_damage():
	health -= 1
	$AnimatedSprite2D.play("DAMAGE")
	if health == 0:
		queue_free()
		
func _on_animated_sprite_2d_animation_finished() -> void:
	$AnimatedSprite2D.play("WALKING")
	
func _on_tree_exited() -> void:
	GameManager.score += 1
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	run = true
func _on_area_2d_body_exited(body: Node2D) -> void:
	run = false
