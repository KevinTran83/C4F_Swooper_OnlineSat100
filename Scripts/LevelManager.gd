extends Node

@export var levels : Array[PackedScene]

var currentLevel : Node
var currentLevelNo : int = 0

func _ready() -> void:
    SpawnLevel()
    
func SpawnLevel() -> void:
    if currentLevel : currentLevel.queue_free()
    
    currentLevel = levels[currentLevelNo].instantiate()
    add_child(currentLevel)
    currentLevelNo += 1
