extends Area2D

const SPEED = 1000
const RANGE = 2000

var travelled_distance = 0

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()

func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		const IMPACT = preload("res://ASSETS/pistol/impact/impact.tscn")
		var poof = IMPACT.instantiate()
		body.add_child(poof)
		poof.global_position = body.global_position
		body.take_damage()
