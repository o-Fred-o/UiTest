extends HBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Play_button_down():
	Global.time_begin = OS.get_ticks_usec()
	Global.time_delay = AudioServer.get_time_to_next_mix() + AudioServer.get_output_latency()
	Global.play=!Global.play

func _on_Pause_button_down():
	Global.play=!Global.play
