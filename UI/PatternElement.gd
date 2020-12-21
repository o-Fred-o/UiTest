extends Control

export(Color) var intrument_color
export(int) var element_size
export(int) var note_time
export(int) var note_value

func _ready():
    $ReferenceRect.color=intrument_color
    $ReferenceRect.rect_size=Vector2(element_size,element_size)

func _on_ColorRect_mouse_entered():
    $ReferenceRect.color=intrument_color

func _on_ColorRect_mouse_exited():
    $ReferenceRect.color=intrument_color
