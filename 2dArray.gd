extends Control

var bloc = [0,0,0,0,0,0,0,0]
# bloc
# 	indice = temps
# 	valeur = note


# Called when the node enters the scene tree for the first time.
func _ready():
    for indice in range(16):
        #for note in range(16):
            var button = CheckBox.new()
            button.set_position(Vector2(20,indice*16))
            #button.toggle_mode=true
            #button.rect_min_size=Vector2(8,8)
            add_child(button)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
