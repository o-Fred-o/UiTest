extends Control

var main_tick

# Called when the node enters the scene tree for the first time.
func _ready():
	$TopMenu/HBoxContainer/SpeedSlider.value=Global.bpm
	$TopMenu/HBoxContainer/SpeedLabel.text="BPM : "+String(Global.bpm)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (!Global.play):
		return
	
	var time = 0.0
	# Obtain from ticks.
	time = (OS.get_ticks_usec() - Global.time_begin) / 1000000.0
	# Compensate.
	time -= Global.time_delay
	#1 noire : 1 temp
	var beat = int(time * Global.bpm / 60.0)
	#1 double croche : 1/4 temps
	var tick = int(time * Global.bpm / 15.0)
	var current_beat = (beat% Global.bars) +1
	var current_tick = tick% (Global.bars*4)
	
	#var seconds = int(time)
	#var seconds_total = int($Player.stream.get_length())
	#$TopMenu/HBoxContainer/CurrentTimeLabel.text = str("BEAT: ", beat % BARS + 1, "/", BARS, " TIME: ", seconds / 60, ":", strsec(seconds % 60), " / ", seconds_total / 60, ":", strsec(seconds_total % 60))
	$TopMenu/HBoxContainer/CurrentTimeLabel.text = str("BEAT: ", current_beat, "/", Global.bars)
	#plug aux patterns
	if (main_tick != current_tick):
		main_tick=current_tick
		for pattern in $Patterns.get_children():
			pattern.current_time=main_tick
			pattern.show_current_time()
			pattern.play_notes()


func _on_SpeedSlider_value_changed(value):
	$TopMenu/HBoxContainer/SpeedLabel.text="BPM : "+String(value)
	Global.bpm = value
	
func strsec(secs):
	var s = str(secs)
	if (secs < 10):
		s = "0" + s
	return s
