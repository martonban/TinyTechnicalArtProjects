extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(str(Time.get_ticks_msec() / 1000.0))
