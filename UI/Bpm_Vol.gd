extends VBoxContainer

func _ready():
    $BpmInfo/SpeedSlider.value=Global.bpm
    $BpmInfo/SpeedLabel.text="BPM : "+String(Global.bpm)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
        #var seconds = int(time)
    #var seconds_total = int($Player.stream.get_length())
    #$TopMenu/HBoxContainer/CurrentTimeLabel.text = str("BEAT: ", beat % BARS + 1, "/", BARS, " TIME: ", seconds / 60, ":", strsec(seconds % 60), " / ", seconds_total / 60, ":", strsec(seconds_total % 60))
    $BpmInfo/CurrentTimeLabel.text = str("BEAT: ", Global.current_beat, "/", Global.bars)

func _on_SpeedSlider_value_changed(value):
    $BpmInfo/SpeedLabel.text="BPM : "+String(value)
    Global.bpm = value 

func strsec(secs):
    var s = str(secs)
    if (secs < 10):
        s = "0" + s
    return s
