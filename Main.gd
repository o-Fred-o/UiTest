extends Control

var speed
var myTimer
var pos
var childList

# Called when the node enters the scene tree for the first time.
func _ready():
	myTimer=0
	speed=0.3
	$VBoxContainer/HBoxContainer/SpeedSlider.value=speed*100
	#$Pattern.play=false
	pos=0
	#$Pattern.notes=[]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ($Pattern.play):
		if (myTimer>=speed):
			myTimer=0
			$Pattern.current_time=pos           
			#position suivante
			pos=pos+1
			if (pos>$Pattern.width-1):
				pos=0
			$VBoxContainer/HBoxContainer3/CurrentTimeLabel.text="Time : " + String(pos)
			$Pattern.show_current_time()
			$Pattern.play_notes()
			
		myTimer += delta

func _on_Play_button_down():
	pos=0
	$Pattern.play= !$Pattern.play

func _on_Pause_button_down():
	$Pattern.play= !$Pattern.play

func _on_SpeedSlider_value_changed(value):
	$VBoxContainer/HBoxContainer2/SpeedLabel.text="Speed : "+String(value)
	speed = value/100
	
