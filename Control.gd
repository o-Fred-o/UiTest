extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var edit_value = $TabContainer/Options/LineEdit
onready var slider_value =  $TabContainer/Options/HSlider


# Called when the node enters the scene tree for the first time.
func _ready():
    edit_value.text = "0" #print("%5.2f",slider_value.value)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    # print(slider_value.value)
    pass


func _on_HSlider_value_changed(value):
    edit_value.text =String(value)


func _on_Valider_pressed():
    var popup = $PopupDialog
    popup.show()


