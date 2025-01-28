extends Label


@onready var timer = %Timer

func _process(delta):
	self.text = "TIME REMAINING: \n" + str(roundf(timer.time_left)) + " SECONDS"
