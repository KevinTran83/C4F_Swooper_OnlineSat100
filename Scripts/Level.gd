extends Node

@export var duration : float = 10

func _ready() -> void:
    var hud : HUD = get_tree().get_root().get_node("Main").get_node("HUD")
    hud.start(duration)
