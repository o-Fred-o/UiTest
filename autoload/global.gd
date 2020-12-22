extends Node

var bpm = 116
const bars = 4
var nb_parttern = 2

var volume = 0
var mute = false
var play = false

var current_tick
var current_beat

# Used by system clock.
var time_begin
var time_delay


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.
