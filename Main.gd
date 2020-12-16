extends Control

var speed
var myTimer
var play
var pos
var childList

# Called when the node enters the scene tree for the first time.
func _ready():
	myTimer=0
	speed=0.3
	$VBoxContainer/HBoxContainer/SpeedSlider.value=speed*100
	play=false
	pos=0
	childList=$VBoxContainer2.get_children()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (play):
		if (myTimer>=speed):
			myTimer=0
			#on efface tout
			for a_child in $VBoxContainer2.get_children():
				a_child.color=Color(0,0,0,1)
			
			#on active celui a la position pos
			childList[pos].color=Color(1,0,0,1)
			
			#position suivante
			pos=pos+1
			if (pos>childList.size()-1):
				pos=0
			
		myTimer += delta


func _on_Play_button_down():
	pos=0
	play= !play

func _on_Pause_button_down():
	play= !play


func _on_SpeedSlider_value_changed(value):
	$VBoxContainer/HBoxContainer2/SpeedLabel.text=String(value)
	speed = value/100
	
