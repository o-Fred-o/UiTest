extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ColorRect_mouse_entered():
	color = Color(1,0,0,1)


func _on_ColorRect_mouse_exited():
	color = Color(1,1,1,1)
