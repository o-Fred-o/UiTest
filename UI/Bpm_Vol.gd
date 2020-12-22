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
    $BpmInfo/GlobalTimeLabel.text = str("Time: ", Global.current_tick)

func _on_SpeedSlider_value_changed(value):
    $BpmInfo/SpeedLabel.text="BPM : "+String(value)
    Global.bpm = value 

func strsec(secs):
    var s = str(secs)
    if (secs < 10):
        s = "0" + s
    return s

func _on_VolumeSlider_value_changed(value):
    var vol_in_db=value/10
    $VolumeInfo/VolumeLabel.text="Db : "+String(vol_in_db)
    Global.volume=vol_in_db

func _on_VolMute_button_down():
    Global.mute=!Global.mute
    
    var texture
    if (Global.mute):
        texture = load("res://assets/UI/baseline_volume_mute_white_18dp.png")
    else:
        texture = load("res://assets/UI/baseline_volume_up_white_18dp.png")
    
    $VolumeInfo/VolMute.icon=texture
    
