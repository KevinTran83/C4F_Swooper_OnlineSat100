class_name HUD
extends Node

@onready var score : Label = $Score
var timer : Timer

# TODO: Move to different scripts.
@onready var victory : Label = $Victory
@onready var defeat  : Label = $Defeat
func hideLabels() -> void:
    victory.set_visible(false)
    defeat .set_visible(false)

func _ready() -> void:
    timer = Timer.new()
    timer.set_one_shot(true)
    add_child(timer)
    
    # TODO: Move to different scripts.
    hideLabels()
    
func _process(delta: float) -> void:
    if not timer.is_stopped() : score.text = str( snapped(timer.get_time_left(), 0.01) )
    
func start(duration : float) -> void:
    timer.set_wait_time(duration)
    timer.start()
    
func stop() -> void:
    timer.stop()
