extends Control

export var width = 16
export var height = 16
export var cell_size = 16
export(Color) var intrument_color
export(AudioStream) var instrument
export var pattern_indice = 0
export var volume = 0

var notes = []
var current_time = 0

var element = load("res://UI/PatternElement.tscn")
var cell
var current_time_rect
var mouse_pos
var array_pos
var active_pattern
var pattern_pos

func _ready():
    #cellule active
    cell = element.instance()
    cell.element_size=cell_size
    cell.intrument_color=intrument_color
    add_child(cell)

    #bande pour la position actuelle du temps
    current_time_rect=ColorRect.new()
    current_time_rect.rect_position=Vector2(current_time*cell_size-1,0)
    current_time_rect.rect_size=Vector2(cell_size,height*cell_size)
    current_time_rect.color=Color(0.2,0.2,0.2,0.5)
    current_time_rect.visible=false
    add_child(current_time_rect)
    draw_notes()
    
    $AudioStreamPlayer.set_stream(instrument)

func _process(delta):        
    if (!Global.play):
        return           
    if (current_time != Global.current_tick):
        current_time=Global.current_tick
        show_current_time()
        play_notes()
        active_pattern=current_time/16
        pattern_pos=current_time-pattern_indice*16

func _input(event):
    if event is InputEventMouseMotion:
        draw_mouse()
    elif event is InputEventMouseButton and event.is_pressed():
        if (array_pos.x >= 0 and array_pos.y >= 0 and array_pos.x < width and array_pos.y < height):
            if (notes.count(array_pos)==0):
                notes.append(array_pos)
            else:
                notes.erase(array_pos)
        draw_notes()

# dessine le canvas du pattern : une grille
func _draw():
    for i in width+1:
        var deb = Vector2(i*cell_size,0)
        var fin = Vector2(i*cell_size,height*cell_size)

        if (i%4 == 0):
             draw_line(deb,fin,Color.gray,2)
        else:
            draw_line(deb,fin,Color.gray,1)

    for j in height+1:
        var deb = Vector2(0, j*cell_size)
        var fin = Vector2(width*cell_size,j*cell_size)
        draw_line(deb,fin,Color.gray)
    
func get_minimum_size():
    return Vector2(width*cell_size, height*cell_size)
        
# affiche le curseur de la souris et la note 
func draw_mouse():
    mouse_pos = get_local_mouse_position()
    array_pos = Vector2(int(mouse_pos.x/cell_size),int(mouse_pos.y/cell_size))

    $mouse_pos.text= "X : " + String(mouse_pos.x) + " Y : "+String(mouse_pos.y)
    $array_pos.text= "X : " + String(array_pos.x) + " Y : "+ String(array_pos.y)
    
    if (array_pos.x >= 0 and array_pos.y >= 0 and array_pos.x < width and array_pos.y < height):
        cell.visible=true
        cell.rect_position=Vector2(array_pos.x*cell_size,array_pos.y*cell_size)
    else:
        cell.visible=false

func draw_notes():
    #ajout des element pour les notes 
    delete_children($liste_notes)
    var global_position= get_global_rect().position
    for n in notes:
        var note = element.instance()
        note.element_size=cell_size        
        note.rect_position=Vector2(global_position.x+n.x*cell_size,global_position.y+n.y*cell_size)
        note.intrument_color=intrument_color
        note.note_time=n.x
        note.note_value=n.y
        $liste_notes.add_child(note)
    
# affiche une barre vertical pour le current_time    
func show_current_time():
    if (active_pattern == pattern_indice):
        current_time_rect.visible=true
        current_time_rect.rect_position=Vector2(pattern_pos*cell_size,0)
    else:
        current_time_rect.visible=false
    
#joue les notes de l'instrument    
func play_notes():
    for n in $liste_notes.get_children():
        if (active_pattern == pattern_indice && n.note_time == pattern_pos):
            $AudioStreamPlayer.set_pitch_scale(n.note_value/10)
            $AudioStreamPlayer.set_volume_db(Global.volume)
            $AudioStreamPlayer.play()
    
func delete_children(node):
    for n in node.get_children():
        node.remove_child(n)
        n.queue_free()
