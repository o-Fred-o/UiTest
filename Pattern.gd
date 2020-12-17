extends Node2D

export var notes = []
export var current_time = 1

export var pos_x=0
export var pos_y=0
export var width = 16
export var height = 16
export var cell_size = 16
export var play=false

var element = load("res://Pattern_element.tscn")
var cell
var current_time_rect
var mouse_pos
var array_pos

# Called when the node enters the scene tree for the first time.
func _ready():
    #cellule active
    cell = element.instance()
    cell.rect_size=Vector2(cell_size,cell_size)
    add_child(cell)

    #bande pour la position actuelle du temps
    current_time_rect=ColorRect.new()
    current_time_rect.rect_position=Vector2(pos_x+(current_time*cell_size),pos_y)
    current_time_rect.rect_size=Vector2(cell_size,height*cell_size)
    current_time_rect.color=Color(0.2,0.2,0.2,0.5)
    add_child(current_time_rect)
    
    draw_notes()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if play:
        show_current_time()
        #play_notes()

func _input(event):
    if event is InputEventMouseMotion:
        draw_mouse()
    elif event is InputEventMouseButton:
        #array_pos = Vector2(int((mouse_pos.x-pos_x)/cell_size),int((mouse_pos.y-pos_y)/cell_size))
        if (notes[array_pos.x]==0):
             notes[array_pos.x]=array_pos.y
        else:
            notes[array_pos.x]=0
    draw_notes()

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
    
# affiche le curseur de la souris et la note 
func draw_mouse():
    mouse_pos = get_global_mouse_position()
    array_pos = Vector2(int((mouse_pos.x-pos_x)/cell_size),int((mouse_pos.y-pos_y)/cell_size))

    $mouse_pos.text= "X : " + String(mouse_pos.x) + " Y : "+String(mouse_pos.y)
    $array_pos.text= "X : " + String(array_pos.x) + " Y : "+ String(array_pos.y)
    
    if (array_pos.x >= 0 and array_pos.y >= 0 and array_pos.x < width and array_pos.y < height):
        cell.rect_position=Vector2(pos_x+array_pos.x*cell_size,pos_y+array_pos.y*cell_size)
    else:
        cell.rect_position=Vector2(-cell_size,-cell_size)

func draw_notes():
    #notes = [0,0,0,0,2,0,0,4,0,0,0,8,0,2,2,0]
    #ajout des element pour les notes 
    for i in notes.size():
        if (notes[i] != 0):
            var note = element.instance()
            note.rect_size=Vector2(cell_size,cell_size)
            note.rect_position=Vector2(pos_x+i*cell_size,pos_y+notes[i]*cell_size)
            add_child(note)
    
# affiche une barre vertical pour le current_time    
func show_current_time():
    current_time_rect.rect_position=Vector2(pos_x+(current_time*cell_size),pos_y)
    
#joue les notes de l'instrument    
func play_notes():
    pass    
