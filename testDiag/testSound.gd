extends Control

var stop=false
var main_bus

var myphaser

func _ready():
    print(AudioServer.get_bus_name(0))
    #$HBoxContainer2/MenuButton.add_item("test")

func _process(delta):
    pass

func _on_Button_button_down():
    stop=false
    $AudioStreamPlayer.play()

func _on_AudioStreamPlayer_finished():
    if (!stop):
        $AudioStreamPlayer.play()

func _on_Stop_button_down():
    stop=true
    AudioServer.remove_bus_effect(0,0)


func _on_Effect_button_down():
    myphaser=AudioEffectPhaser.new()
    AudioServer.add_bus_effect(0,myphaser,0)

func _on_PitchSlider_value_changed(value):
    $AudioStreamPlayer.set_pitch_scale(value)
    $HBoxContainer/Label.text=String(value)


func _on_DepthSlider_value_changed(value):
    myphaser.depth=value
