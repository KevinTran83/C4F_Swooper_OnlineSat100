extends Node

@export var speed : float = 10

@onready var body : CharacterBody3D = get_parent()

func _physics_process(delta: float) -> void:
    var velocity : Vector3 = -body.global_basis.z * speed
    body.velocity = velocity
    body.move_and_slide()
