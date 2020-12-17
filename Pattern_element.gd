extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func _on_ColorRect_mouse_entered():
#	color_rect = ColorRect.new()
#	color_rect.set_position($ReferenceRect.rect_position)
#	color_rect.set_size($ReferenceRect.rect_size)
#	color_rect.color=Color.red
#	add_child(color_rect)
    $ReferenceRect.color=Color.red

func _on_ColorRect_mouse_exited():
    #remove_child(color_rect)
    $ReferenceRect.color=Color.white
    pass
