extends VBoxContainer

export var width = 16
export var height = 16
export var cell_size = 12
export(Color) var intrument_color
export(AudioStream) var instrument
var nb_patterns

var patternScene = load("res://UI/Pattern.tscn")

func _ready():
    rect_min_size=Vector2(width*cell_size, height*cell_size)
    
    nb_patterns=Global.nb_pattern
       
    for i in nb_patterns:
        var pattern
        pattern = patternScene.instance()
        pattern.pattern_indice=i
        pattern.height=height
        pattern.width=width
        pattern.cell_size=cell_size
        pattern.intrument_color=intrument_color
        pattern.instrument=instrument
        $HBoxContainer/PatternList.add_child(pattern)

    #si height==1 alors on affiche l'interface pour le rythme
    if (height==1):
        var rythmChoiceContainer=find_node('RythmChoice')
        rythmChoiceContainer.visible=true
        var EffectChoiceContainer=find_node('EffectChoice')
        EffectChoiceContainer.visible=false        
        var PresetList=find_node('RythmPreset')
        PresetList.add_item("Preset 1")
        PresetList.add_item("Preset 2")


func _on_RythmPreset_item_selected(index):
    if (index == 0):
        #ajouter des notes dans patternList
        var maListe = $HBoxContainer/PatternList.get_children()
        for patt in maListe:
            patt.notes=[Vector2(0,0),Vector2(4,0),Vector2(8,0),Vector2(12,0)]
            patt.draw_notes()
