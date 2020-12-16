extends Node2D

var notes = []
var current_time = 1

var pos_x=50
var pos_y=50
var width = 16
var height = 16
var cell_size = 16

var element = load("res://Pattern_element.tscn")
var cell

# Called when the node enters the scene tree for the first time.
func _ready():
	notes = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
	#ajout des element pour les notes 
	var note1 = element.instance()
	note1.rect_position=Vector2(pos_x+1*cell_size,pos_y+3*cell_size)
	add_child(note1)
	
	cell = element.instance()
	add_child(cell)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	draw_mouse()
#    pass

# dessine le canvas du pattern : une grille
func _draw():
	
	for i in height+1:
		var deb = Vector2(pos_x+i*cell_size,pos_y)
		var fin = Vector2(pos_x+i*cell_size,pos_y+width*cell_size)
		draw_line(deb,fin,Color.red)

	for j in width+1:
		var deb = Vector2(pos_x, pos_y+j*cell_size)
		var fin = Vector2(pos_x+height*cell_size,pos_y+j*cell_size)
		draw_line(deb,fin,Color.red)
	
	pass
	
# affiche le curseur de la souris et la note 
func draw_mouse():
	var mouse_pos = get_global_mouse_position()
	#var min_pos = Vector2(pos_x,pos_y)
	#var max_pos = Vector2(pos_x+height*cell_size,pos_y+width*cell_size)
	#if (mouse_pos.x>min_pos.x and  mouse_pos.x<max_pos.x):
	var array_pos = Vector2(int((mouse_pos.x-pos_x)/cell_size),int((mouse_pos.y-pos_y)/cell_size))

	$mouse_pos.text= "X : " + String(mouse_pos.x) + " Y : "+String(mouse_pos.y)
	$array_pos.text= "X : " + String(array_pos.x) + " Y : "+ String(array_pos.y)
	
	if (array_pos.x >= 0 and array_pos.y >= 0 and array_pos.x < width and array_pos.y < height):
		cell.rect_position=Vector2(pos_x+array_pos.x*cell_size,pos_y+array_pos.y*cell_size)
	
# affiche une barre vertical pour le current_time    
func show_current_time():
	pass
