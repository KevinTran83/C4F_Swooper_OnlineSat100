extends RigidBody3D

var main : Main

func _ready() -> void:
    main = get_tree().get_root().get_node("Main")
    
func PlayerHit(body : Node) -> void:
    print ("Hello")
    if body.is_in_group("Player") : main.Victory()
