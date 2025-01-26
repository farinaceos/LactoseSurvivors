extends Label

func _process(delta):
	self.text = "You scored\n" + "     " + str(GameManager.score) + "\nPoints"
