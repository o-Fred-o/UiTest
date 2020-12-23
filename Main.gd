extends Control

var main_tick

func _ready():
    pass

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
        
    Global.current_beat = (beat% Global.bars) +1
    Global.current_tick = tick % (Global.bars*4*Global.active_patterns)
