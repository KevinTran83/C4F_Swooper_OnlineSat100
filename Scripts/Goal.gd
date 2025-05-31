extends Node

var main : Main

func _ready() -> void:
    main = get_tree().get_root().get_node("Main")
    
func PlayerHit(body : Node) -> void:
    print (body.name)
    if body.is_in_group("Player") : main.Victory()
