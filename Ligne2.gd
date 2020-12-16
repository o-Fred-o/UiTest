extends HBoxContainer


export var nb_button = 4

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#generer une ligne de boutons
	var butt = Button.new()
	butt.set_size(Vector2(24,24),false)
	add_child(butt)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
