extends Control

var sample_hz = 22050.0 # Keep the number of samples to mix low, GDScript is not super fast.
var pulse_hz = 440.0
var phase = 0.0

var modulation = 0.5

var playback: AudioStreamPlayback = null # Actual playback stream, assigned in _ready().

func _fill_buffer():
    var increment = pulse_hz / sample_hz

    var to_fill = playback.get_frames_available()
    while to_fill > 0:
        var test
        test=sin(phase * TAU)
        
        var frame_value
        frame_value=Vector2.ONE * sin(modulation + test * TAU)
        
        playback.push_frame(frame_value) # Audio frames are stereo.
        phase = fmod(phase + increment, 1.0)
        to_fill -= 1
        $VBoxContainer/PanelInstrument/VBoxContainer/Phase/PhaseValueLabel.text=String(phase)

func _process(_delta):
    _fill_buffer()

func _ready():
    $Player.stream.mix_rate = sample_hz # Setting mix rate is only possible before play().
    playback = $Player.get_stream_playback()
    _fill_buffer() # Prefill, do before play() to avoid delay.
    $Player.play()

func _on_PulseSlider_value_changed(value):
    pulse_hz=value
    $VBoxContainer/PanelInstrument/VBoxContainer/Pulse/PulseValueLabel.text=String(value)

func _on_VolumeSlider_value_changed(value):
    $Player.set_volume_db(value)
    $VBoxContainer/PanelVolume/VBoxContainer/Volume/VolumeValueLabel.text=String(value)

func _on_PitchSlider_value_changed(value):
    $Player.set_pitch_scale(value)
    $VBoxContainer/PanelVolume/VBoxContainer/Pitch/PitchValueLabel.text=String(value)

func _on_ModulationSlider_value_changed(value):
    modulation=value
    $VBoxContainer/PanelInstrument/VBoxContainer/Modulation/ModulationValueLabel.text=String(value)
