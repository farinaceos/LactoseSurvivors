extends Area2D

# YOL's aiming function -> Using lambda to always aim the closest mobs
func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies().map(position_from_array)
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		for enemy in enemies_in_range:
			if enemy.distance_to(global_position) < target_enemy.distance_to(global_position):
				target_enemy = enemy
		look_at(target_enemy)
		
		
func position_from_array(enemy):
	return enemy.global_position

#Mardo arrumou o codigo da vaca
