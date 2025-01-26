extends Area2D

func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	# Check if there are enemies in range
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range[0]
		# Find the nearest enemy
		for enemy in enemies_in_range:
			if enemy.global_position.distance_to(global_position) < target_enemy.global_position.distance_to(global_position):
				target_enemy = enemy
		# Rotate the arrow to point at the nearest enemy
		look_at(target_enemy.global_position)

#func _physics_process(delta):
	#var enemies_in_range = get_overlapping_bodies().map(position_from_array)
	#if enemies_in_range.size() > 0:
		#var target_enemy = enemies_in_range.front()
		#for enemy in enemies_in_range:
			#if enemy.distance_to(global_position) < target_enemy.distance_to(global_position):
				#target_enemy = enemy
		#look_at(target_enemy)
#
#func position_from_array(enemy):
	#return enemy.global_position
