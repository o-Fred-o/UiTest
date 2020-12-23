extends Button

func _ready():
    pass # Replace with function body.

func _on_MutePattern2_toggled(button_pressed):
    if (button_pressed && Global.active_patterns==1):
        Global.active_patterns=Global.active_patterns+1
    else:
        Global.active_patterns=Global.active_patterns-1
    print(Global.active_patterns)
