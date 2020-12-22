extends HBoxContainer

export var width = 16
export var height = 16
export var cell_size = 16
export(Color) var intrument_color
export(AudioStream) var instrument
var nb_patterns = 1

var patternScene = load("res://UI/Pattern.tscn")

func _ready():
	rect_min_size=Vector2(width*cell_size, height*cell_size)
	
	nb_patterns=Global.nb_parttern
	   
	for i in nb_patterns:
		var pattern
		pattern = patternScene.instance()
		pattern.pattern_indice=i
		pattern.height=height
		pattern.width=width
		pattern.cell_size=cell_size
		pattern.intrument_color=intrument_color
		pattern.instrument=instrument
		$PatternList.add_child(pattern)

#    for pat in $PatternList.get_children():
#        pat.pattern_position=1
#        pat.height=height
#        pat.intrument_color=intrument_color
#        pat.instrument=instrument
#        pat.play=Global.play
#        pat.current_tick=Global.current_tick 
